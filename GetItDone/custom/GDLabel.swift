//
//  GDLabel.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDLabel:UILabel {
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("inti(coder:) has note been implemented")
  }
  
  init(title:String = "default text", color:UIColor = .white, size:CGFloat = 16, frame:CGRect = .zero, textAlign:NSTextAlignment = .left) {
    super.init(frame: .zero)
    if frame == .zero {
      self.translatesAutoresizingMaskIntoConstraints = false
    }
    self.text = title
    self.textColor = color
    self.font = UIFont.systemFont(ofSize: size)
    self.textAlignment = textAlign
    
    
  }
  
}
