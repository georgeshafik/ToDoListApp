//
//  NewItemPopup.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDNewItemPopup:GDGradient {
  
  let cancel = GDButton(title: "  cancel  ", type: .roundedText, radius: 4)
  let add = GDButton(title: "  add  ", type: .roundedText, radius: 4)
  let textField = GDTextField(placeholder: "  go buy Ikea frames  ", inset: 6)
  var delegate:GDNewItemDelegate?
  
  @objc func handleCancel() {
    cancel.animateButtonClick() //factored button click press behaviour UIButton extension
    print("Cancel button clicked")
  }
  
  @objc func handleAdd() {
    add.animateButtonClick() //factored button click press behaviour UIButton extension
    print("Add button clicked - from @objc func handleAdd()")
    // here we are check if there is a delegate assigned before call the method addItemToList
    // the if let condition assigns self.delegate to delegate if one is assigned and executes the condition
    // if no delegate is assign then the if conditionn fails and nothing crashes
    if let delegate = self.delegate {
      delegate.addItemToList()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let inset:CGFloat = 12
    
    self.layer.cornerRadius = 14
    
    addSubview(cancel)
    cancel.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
    cancel.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
    cancel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    cancel.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
    
    addSubview(add)
    add.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
    add.rightAnchor.constraint(equalTo: rightAnchor, constant: inset * -1).isActive = true
    add.heightAnchor.constraint(equalToConstant: 20).isActive = true

    add.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
    
    addSubview(textField)
    textField.topAnchor.constraint(equalTo: add.bottomAnchor, constant: 8).isActive = true
    textField.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
    textField.rightAnchor.constraint(equalTo: rightAnchor, constant: inset * -1).isActive = true
    textField.heightAnchor.constraint(equalToConstant: 28).isActive = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
