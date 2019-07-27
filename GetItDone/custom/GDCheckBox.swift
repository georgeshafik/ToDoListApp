//
//  GDCheckBox.swift
//  GetItDone
//
//  Created by George Shafik on 27/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDCheckBox:UIButton {
  
  var delegate:GDListCellDelegate?
  
  var toggled:Bool? {
    didSet {
      if let toggled = toggled {
        // Animate our checkbox when changing state
        UIView.animate(withDuration: 0.2) {
          if toggled {
            self.backgroundColor = .green
            self.setImage(UIImage(named: "done-icon"), for: .normal)
          } else {
            self.backgroundColor = .clear
            self.setImage(UIImage(), for: .normal)
          }
        }
      }
    }
  }
  
  @objc func toggleStatus() {
    if let status = toggled,
      let delegate = self.delegate {
      toggled = !status
      delegate.toggleTodo(status: !status)
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    
    layer.borderWidth = 1
    layer.borderColor = UIColor.grayZero.cgColor
    
    addTarget(self, action: #selector(self.toggleStatus), for: .touchUpInside)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
