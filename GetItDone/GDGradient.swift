//
//  GDGradient.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDGradient:UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.translatesAutoresizingMaskIntoConstraints = false // you need to set this to false in order to add your own constraints
    
    if let layer = self.layer as? CAGradientLayer {
      layer.colors = [UIColor.blue.cgColor, UIColor.gray.cgColor]
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
