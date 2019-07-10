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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let inset:CGFloat = 16
    
    self.layer.cornerRadius = 14
    
    addSubview(cancel)
    cancel.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
    cancel.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
    cancel.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
