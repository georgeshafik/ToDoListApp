//
//  GDHeaderView.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDHeaderView: UIView {
  
  init(frame: CGRect = .zero, title:String = "header title", subtitle:String = "header subtitle") {
    super.init(frame: frame)
    if frame == .zero {
      translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  


}
