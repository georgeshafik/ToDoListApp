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
  
  init(title:String = "button text", frame:CGRect = .zero, type:ButtonOptions = .roundedText) {
    super.init(frame: frame)
    if frame == .zero {
      self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    switch type {
      case .roundedText:
        self.title = title
        self.phaseTwo()
      case .squareIcon:
        break;
      default: break;
    }
    
  }
  
  func phaseTwo() {
    self.setTitle(self.title, for: .normal)
    self.setTitleColor(.grayZero, for: .normal)
    self.layer.cornerRadius = 20 // half the height
    self.backgroundColor = .white
    if let titleLabel = self.titleLabel {
      titleLabel.font = UIFont.init(name: "Raleway-Regular", size: 16)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
