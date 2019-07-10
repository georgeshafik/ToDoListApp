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
  let addButton = GDButton(title: "+", type: .squareIcon)
  
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
    
    addSubview(addButton)
    addButton.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor).isActive = true
    addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20 - 8).isActive = true
    addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1).isActive = true // it will take the height of heightAnchor and multiply it by 1 so the width in this case is 24 * 1 - a square
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
