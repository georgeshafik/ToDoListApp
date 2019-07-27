//
//  GDButton.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDButton:UIButton {
  
  var title:String!
  var type:ButtonOptions!
  var radius:CGFloat!
  
  init(title:String = "button text", frame:CGRect = .zero, type:ButtonOptions = .roundedText, radius:CGFloat = 20) {
    super.init(frame: frame)
    if frame == .zero {
      self.translatesAutoresizingMaskIntoConstraints = false
    }

    self.title = title
    self.type = type
    self.radius = radius
    self.phaseTwo()
    
  }
  
  func phaseTwo() {
//      self.setTitle(self.title, for: .normal)
//      self.setTitleColor(.grayZero, for: .normal)
      self.backgroundColor = .white

      if let titleLabel = self.titleLabel {
        titleLabel.font = UIFont.init(name: "Raleway-Regular", size: 16)
      }
    
      switch self.type {
        case ButtonOptions.roundedText:
          self.roundedText()
        case ButtonOptions.squareIcon:
          self.squareIcon()
        default: break;
      }
  }
  
  func squareIcon() {
    // thiw is where we will set the customer icons
//    if let titleLabel = self.titleLabel {
//      titleLabel.font = UIFont.init(name: "Raleway-Regular", size: 24)
//    }
    self.setImage(UIImage(named: "add-icon"), for: .normal)
    
  }
  
  func roundedText() {
    self.setTitle(self.title, for: .normal)
    self.setTitleColor(.grayZero, for: .normal)
    //self.layer.cornerRadius = 20 // half the height
    self.layer.cornerRadius = self.radius
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  

  
}
