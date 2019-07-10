//
//  GDGradient.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDGradient:UIView {
  
  var colors:[CGColor] = [
    UIColor.init(red: 100, green: 228, blue: 255).cgColor,
    UIColor.init(red: 58, green: 123, blue: 213).cgColor
  ]
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.translatesAutoresizingMaskIntoConstraints = false // you need to set this to false in order to add your own constraints
    
    if let layer = self.layer as? CAGradientLayer {
      layer.colors = self.colors
      layer.locations = [0.0, 1.2]
    }    
  }
  
  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
