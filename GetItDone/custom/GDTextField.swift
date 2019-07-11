//
//  GDTextField.swift
//  GetItDone
//
//  Created by George Shafik on 11/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDTextField:UITextField {
  
  init(frame:CGRect = .zero, placeholder:String = "placeholder", radius:CGFloat = 4) {
    super.init(frame: .zero)
    self.checkIfAutoLayout()
    
    self.placeholder = placeholder // UITextField actuall has a field also called placeholder
    self.backgroundColor = .white
    self.layer.cornerRadius = radius
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
