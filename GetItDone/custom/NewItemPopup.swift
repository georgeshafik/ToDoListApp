//
//  NewItemPopup.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class NewItemPopup:GDGradient {
  
  let cancel = GDButton(title: "  cancel  ", type: .roundedText, radius: 4)
  let add = GDButton(title: "  add  ", type: .roundedText, radius: 4)
  let textField = GDTextField(placeholder: "  go buy Ikea frames  ")
  
  @objc func handleCancel() {
    cancel.animateButtonClick()
    print("Cancel button clicked")
  }
  
  @objc func handleAdd() {
    add.animateButtonClick()
    print("Add button clicked")
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
