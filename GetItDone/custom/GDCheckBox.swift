//
//  GDCheckBox.swift
//  GetItDone
//
//  Created by George Shafik on 27/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDCheckBox:UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    
    layer.borderWidth = 1
    layer.borderColor = UIColor.grayZero.cgColor
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
