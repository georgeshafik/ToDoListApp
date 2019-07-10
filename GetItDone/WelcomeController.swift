//
//  ViewController.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {

  let bg:UIView = {
    let view = GDGradient() // this is a type of UIView!
    view.layer.cornerRadius = 6
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // root view in our view conntroller is called view
    view.backgroundColor = .white
    
    view.addSubview(bg)
    
    bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true // 20 pixels from left
    bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true // 20 pixels from top
    bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true // 20 pixels from bottom
    bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true // 20 pixels from right
    
  }

}
