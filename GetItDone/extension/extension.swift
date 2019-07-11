//
//  extension.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

extension UIColor {
  
  static var blueZero: UIColor { return UIColor.init(rgb: 0x64E4FF)}
  static var blueOne: UIColor { return UIColor.init(rgb: 0x3A7BD5)}
  static var grayZero: UIColor { return UIColor.init(rgb: 0x9B9B9B)}
  static var grayOne: UIColor { return UIColor.init(rgb: 0x424242)}
  
  // convenience allows to write out a new initalizer
  convenience init(red: Int, green: Int, blue: Int) {
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
  
  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
  }
}

extension UIView {
  func checkIfAutoLayout() {
    if frame == .zero {
      self.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  func animateView(transform:CGAffineTransform, duration:Double) {
    UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.85,
                   initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                    self.transform = transform
    }, completion: nil)
  }
}

extension UIButton {  
  // Enhancement : re-factor out as a property on a click event when .touchUpInside is used
  func animateButtonClick() {
    UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
      self.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
    }) { (_) in
      // And then re-size batck to it's original size slowly
      UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
        self.transform = CGAffineTransform(scaleX: 1, y: 1)
      })
    }
  }
}
