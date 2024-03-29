//
//  ListController.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class ListController: UIViewController, GDHeaderDelegate, GDNewItemDelegate {
  
  func openAddItemPopup() {
    popup.animatePopup()
  }
  
  func notInList(text:String) -> Bool {
    var isNotInList = true
    self.listData.forEach { (toDo) in
      if (toDo.title == text) {
       isNotInList = false
      }
    }
    
    return isNotInList
  }
  
  func addItemToList(text:String) {
    if (notInList(text: text)) {
//      let newItem = ToDo(id: self.listData.count, title: text, status: false)
//      self.listData.append(newItem)
      self.listTable.reloadData()   // Reload udpated data
      self.updateHeaderItemsLeft()  // Update header label reflecting the number of remaining ToDos
      self.popup.textField.text = ""
      self.popup.animatePopup()
    }
  }
  
  // MARK: - ListController and UI Controls

  let header = GDHeaderView(title: "Stuff to get done", subtitle: "4 left")
  let tbInset:CGFloat = 16
  var bgBottom:NSLayoutConstraint!
  
  // Note is a lazy var so tbInset is initialised
  lazy var bg:UIView = {
    let view = GDGradient() // this is a type of UIView!
    view.layer.cornerRadius = tbInset // it is a lazy var so we wait for tbInset to get initialised first before we can initialise bg
    return view
  }()
  
  let listTable = GDTableView()
  let popup = GDNewItemPopup()
  
  let CELL_ID = "cell_id"
  
  var listData = [ToDo]()
  
  var keyboardHeight:CGFloat = 350
  
  override func viewDidAppear(_ animated: Bool) {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
  }
  
  @objc func keyboardWillShow(notification: Notification) {
    let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
    self.keyboardHeight = keyboardSize.height
  }
  
  func updateHeaderItemsLeft() {
    header.itemsLeft = 0
    
    self.listData.forEach { (toDo) in
      if !toDo.status { header.itemsLeft += 1}
      
    }
  }
  // MARK: - View LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    listData = [
//      ToDo(id: 0, title: "first item", status: false),
//      ToDo(id: 1, title: "hey dood", status: true),
//      ToDo(id: 2, title: "Its lit yo", status: true)
//    ]

//    listData = []
    listData = CoreDataManager.shared.fetchToDos()


    self.updateHeaderItemsLeft()
    
    view.backgroundColor = .white
  
    view.addSubview(header)
    //header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    header.heightAnchor.constraint(equalToConstant: 120).isActive = true
  
    view.addSubview(bg)
    bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true // 20 pixels from left
    bg.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true // 20 pixels from top
    bgBottom = bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100) // 100 pixels from bottom
    bgBottom.isActive = true
    bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true // 20 pixels from right
    
    view.addSubview(listTable)
    listTable.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: tbInset).isActive = true
    listTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: tbInset).isActive = true
    listTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: tbInset * -1).isActive = true
    listTable.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: tbInset * -1).isActive = true
    
    view.addSubview(popup)
    popup.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    popup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    popup.heightAnchor.constraint(equalToConstant: 80).isActive = true
    
    openAddItemPopup()
    
    popup.textField.delegate = self // now we access to the textfield delegate inside our listcontroller
    
    popup.delegate = self
    
    header.delegate = self
    
    listTable.delegate = self
    listTable.dataSource = self
    listTable.register(GDListCell.self, forCellReuseIdentifier: CELL_ID) // Registed GDListCell to listTable
    
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
}

// MARK: - ListController UITextFieldDelegate

// Special note on how we added the delegate to our list controller via an extension declaration instetad of adding to the above
// class ListController: UIViewController, GDHeaderDelegate, UITextFieldDelegate
extension ListController: UITextFieldDelegate {
  
  
  func createAlert(title: String, message: String, textField: UITextField) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

    alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { (action) in
      alert.dismiss(animated: true, completion: nil)
      self.addItemToList(text: textField.text!)
    } ))

    alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { (action) in
      alert.dismiss(animated: true, completion: nil)
      textField.text! = ""
    } ))
    
    self.present(alert,animated: true,completion: nil)
    
  }
  
  
  // handle return key when pressed
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.bgBottom.constant = -100
    textField.resignFirstResponder()

    //print("Return keyboard pressed")
    
    if (!textField.text!.isEmpty) {
      self.createAlert(title: "Item is not empty", message: "To Do Item was supplied", textField: textField)
    }

    return true
  }
  
  // Code handles keyboard scrolling into view
  func textFieldDidBeginEditing(_ textField: UITextField) {
    var heightToAnimate = -keyboardHeight - 20 // when we start editing, makeing room for the keyboard
    
    if textField == popup.textField {
      popup.animateView(transform: CGAffineTransform(translationX: 0, y: -keyboardHeight), duration: 0.5)
      heightToAnimate -= 80
    }
    
    self.bgBottom.constant = heightToAnimate
    UIView.animate(withDuration: 0.3) {
      self.view.layoutIfNeeded()
    }
  }

  // Code handles keyboard scrolling into view
  func textFieldDidEndEditing(_ textField: UITextField) {
    self.bgBottom.constant = -100
    UIView.animate(withDuration: 0.3) {
      self.view.layoutIfNeeded()
    }
    
    if textField == popup.textField {
      popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.6)
    }
  }
  
}

// MARK: - ListController UITableViewDelegate, UITableViewDataSource

extension ListController: UITableViewDelegate, UITableViewDataSource, GDListCellDelegate {
  
  func toggleToDo() {
    
//    let newListData = self.listData.map { (oldToDo) -> ToDo in
//
//      // if the id passed in is equal to toDo id
//      if oldToDo.id == updatedToDo.id {
//        var newToDo = oldToDo
//        newToDo.status = updatedToDo.status
//        newToDo.title = updatedToDo.title
//        return newToDo // Return updated ToDo, Add to newListData, Exit mapping loop
//      } else {
//        return oldToDo // Return ToDo that is unchanged
//      }
//
//    }
//
//    self.listData = newListData   // Assign new list to listData
    self.listData = CoreDataManager.shared.fetchToDos()
    self.listTable.reloadData()   // Reload udpated data
    self.updateHeaderItemsLeft()  // Update header label reflecting the number of remaining ToDos
  }
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      return "To Do"
    } else {
      return "Done"
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let titleForHeader = GDLabel(color: .white, size: 20, frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
    if section == 0 {
      titleForHeader.text = "To Do"
    } else {
      titleForHeader.text = "Done"
    }
    return titleForHeader
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 38
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var count = 0
    
    self.listData.forEach { (toDo) in
      if (section == 0 && !toDo.status) {
        count += 1
      } else if (section == 1 && toDo.status) {
        count += 1
      }
    }
    
    return count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! GDListCell
//    cell.textLabel?.text = listData[indexPath.row].title
    cell.toDo = self.listData[indexPath.row] // the assignement statment triggers of the set method which in term sets the title in the cell
 
    cell.delegate = self
    cell.textField.delegate = self
    var itemsForSection:[ToDo] = []
    
    self.listData.forEach { (toDo) in
      if (indexPath.section == 0 && !toDo.status) {
        itemsForSection.append(toDo)
      } else if (indexPath.section == 1 && toDo.status) {
        itemsForSection.append(toDo)
      }
    }
    
    cell.toDo = itemsForSection[indexPath.row]
    return cell
  }
  
  // Set height of table view row
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 42
  }
  
  //
  
}
