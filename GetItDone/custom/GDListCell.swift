//
//  GDListCell.swift
//  GetItDone
//
//  Created by George Shafik on 11/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDListCell:UITableViewCell {
  
  var delegate:GDListCellDelegate?
  
  @objc func toggleStatus() {
    if let delegate = self.delegate, let toDo = self.toDo {
        let newToDo = ToDo(id: toDo.id, title: textField.text!, status: !toDo.status)
        delegate.toggleToDo(updatedToDo: newToDo)
    }
  }
  
//  let titleLabel = GDLabel(color: .grayZero, size: 14)
  let textField = GDTextField(placeholder: "ToDo", radius: 0, inset: 14)
  
  // The reason we are using a view is because we want the text to be more inset
  let view:UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let box = GDCheckBox()
  
  var toDo:ToDo? {
    didSet {
      if let toDo = toDo {
        print(toDo.status)
        box.toggled = toDo.status
        box.id = toDo.id
        self.textField.text = toDo.title
      }
    }
  }
  
 
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    box.addTarget(self, action: #selector(self.toggleStatus), for: .touchUpInside)
    
    selectionStyle = .none
    backgroundColor = .clear
    
    view.backgroundColor = .white
    
    addSubview(view)
    view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    view.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
    view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
    view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    
    view.addSubview(textField)
    textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    textField.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
    textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
    textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    
    addSubview(box)
    box.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
    // we know height of cell is 42
    // removing 6 from top and bottom 12 in total maning the hight of our box is 30
    //box.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
    //box.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
    //
    // This appeach centers it, sets width and height
    box.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    box.widthAnchor.constraint(equalToConstant: 22).isActive = true
    box.heightAnchor.constraint(equalTo: box.widthAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
