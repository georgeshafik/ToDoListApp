//
//  GDTextField.swift
//  GetItDone
//
//  Created by George Shafik on 11/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDTextField:UITextField {
  
  var insets:UIEdgeInsets!
  
  init(frame:CGRect = .zero, placeholder:String = "placeholder", radius:CGFloat = 4, inset:CGFloat = 0) {
    super.init(frame: .zero)
    self.checkIfAutoLayout()
    
    self.placeholder = placeholder // UITextField actuall has a field also called placeholder
    self.backgroundColor = .white
    self.layer.cornerRadius = radius
    self.insets = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)
    self.textColor = .grayZero
  }
    
  override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: insets)
  }
  
  override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: insets)
  }
  
  override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: insets)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
