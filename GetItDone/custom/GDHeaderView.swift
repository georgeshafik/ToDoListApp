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
  let titleLabel = GDLabel(size: 14)
  let subtitleLabel = GDLabel(size: 24)
  
  init(frame: CGRect = .zero, title:String = "header title", subtitle:String = "header subtitle") {
    super.init(frame: frame)
    if frame == .zero {
      translatesAutoresizingMaskIntoConstraints = false
    }
    self.titleLabel.text = title
    self.subtitleLabel.text = subtitle
    setupLayout()
  }
  
  func setupLayout() {
    addSubview(bg)
    bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
    bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
    addSubview(titleLabel)
    titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 14).isActive = true
    titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20 + 8).isActive = true
    titleLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    addSubview(subtitleLabel)
    subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20 + 8).isActive = true
    subtitleLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: 50).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
