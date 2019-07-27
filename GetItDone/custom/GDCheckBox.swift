//
//  GDCheckBox.swift
//  GetItDone
//
//  Created by George Shafik on 27/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDCheckBox:UIButton {
  
  var toggled:Bool? {
    didSet {
      if let toggled = toggled {

        if toggled {
          backgroundColor = .green
          setImage(UIImage(named: "done-icon"), for: .normal)
        } else {
          backgroundColor = .clear
          setImage(UIImage(), for: .normal)
        }
      }
    }
  }
  
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
