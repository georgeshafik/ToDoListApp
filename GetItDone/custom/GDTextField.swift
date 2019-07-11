//
//  GDTextField.swift
//  GetItDone
//
//  Created by George Shafik on 11/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDTextField:UITextField {
  
  init(frame:CGRect = .zero, placeholder:String = "placeholder") {
    super.init(frame: .zero)
    self.checkIfAutoLayout()
    
    self.placeholder = placeholder // UITextField actuall has a field also called placeholder
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
