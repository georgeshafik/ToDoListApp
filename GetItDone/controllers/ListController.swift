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
    print("trying to open add item popup view - from func openAddItemPopup()")
  }
  
  func addItemToList(text:String) {
    print("text in texfield is \(text)")
  }
  
  // MARK: - ListController and UI Controls

  let header = GDHeaderView(title: "Stuff to get done", subtitle: "4 left")
  let tbInset:CGFloat = 16
  
  // Note is a lazy var so tbInset is initialised
  lazy var bg:UIView = {
    let view = GDGradient() // this is a type of UIView!
    view.layer.cornerRadius = tbInset // it is a lazy var so we wait for tbInset to get initialised first before we can initialise bg
    return view
  }()
  
  let listTable = GDTableView()
  let popup = GDNewItemPopup()
  
  let CELL_ID = "cell_id"
  
  var listData = [
    ToDo(id: 0, title: "first item", status: false),
    ToDo(id: 1, title: "hey dood", status: false),
    ToDo(id: 2, title: "Its lit yo", status: false)
  ]
  
  var keyboardHeight:CGFloat = 350
  
  override func viewDidAppear(_ animated: Bool) {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
  }
  
  @objc func keyboardWillShow(notification: Notification) {
    let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
    self.keyboardHeight = keyboardSize.height
  }
  
  // MARK: - View LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
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
    bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true // 20 pixels from bottom
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
    
    popup.textField.delegate = self // now we access to the textfield delegate inside our listcontroller
    
    popup.delegate = self
    
    header.delegate = self
    
    listTable.delegate = self
    listTable.dataSource = self
    listTable.register(GDListCell.self, forCellReuseIdentifier: CELL_ID) // Registed GDListCell to listTable
  }
  
}

// MARK: - ListController UITextFieldDelegate

// Special note on how we added the delegate to our list controller via an extension declaration instetad of adding to the above
// class ListController: UIViewController, GDHeaderDelegate, UITextFieldDelegate
extension ListController: UITextFieldDelegate {
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    popup.animateView(transform: CGAffineTransform(translationX: 0, y: -keyboardHeight), duration: 0.5)
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.6)
  }
}

// MARK: - ListController UITableViewDelegate, UITableViewDataSource

extension ListController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return listData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! GDListCell
//    cell.textLabel?.text = listData[indexPath.row].title
    cell.toDo = self.listData[indexPath.row] // the assignement statment triggers of the set method which in term sets the title in the cell
    return cell
  }
  
  // Set height of table view row
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 42
  }
  
}
