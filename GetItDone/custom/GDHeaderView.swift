//
//  GDHeaderView.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDHeaderView: UIView {

  let bg = GDGradient()
  
  init(frame: CGRect = .zero, title:String = "header title", subtitle:String = "header subtitle") {
    super.init(frame: frame)
    if frame == .zero {
      translatesAutoresizingMaskIntoConstraints = false
    }
    setupLayout()
    
  }
  
  func setupLayout() {
    addSubview(bg)
    bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
    bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  


}
