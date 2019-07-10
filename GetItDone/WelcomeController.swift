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
  
  let titleLabel = GDLabel(title: "GOT IT DONE", size: 24, textAlign: .center)
  
  // Method 1 - Declaring infoLabel
  //let infoLabel = GDLabel(title: "WELCOME. GET IT DONE IS TO DO LIST.\nREALLY DOPE TO-DO-LIST", size: 14, textAlign: .center)
  // Method 2 - Declaring infoLabel
  let infoLabel:UILabel = {
    let label = GDLabel(title: "WELCOME. GET IT DONE IS TO DO LIST.\nREALLY DOPE TO-DO-LIST", size: 14, textAlign: .center)
    label.numberOfLines = 2
    return label
  }()
  
  let copyright = GDLabel(title: "© 2019 | maxcodes.io", color: .grayZero, size: 14, textAlign: .center)

  let nextButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // root view in our view conntroller is called view
    view.backgroundColor = .white
//    titleLabel.text = "GET IT DONE"
//    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(bg)
    bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true // 20 pixels from left
    bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true // 20 pixels from top
    bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true // 20 pixels from bottom
    bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true // 20 pixels from right
    
    view.addSubview(titleLabel)
    titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
    titleLabel.topAnchor.constraint(equalTo: bg.topAnchor, constant: 60).isActive = true
    
    view.addSubview(infoLabel)
    infoLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
    infoLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor).isActive = true
    infoLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
    infoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
   
    bg.addSubview(nextButton)
    
    view.addSubview(copyright)
    copyright.widthAnchor.constraint(equalToConstant: 200).isActive = true
    copyright.heightAnchor.constraint(equalToConstant: 40).isActive = true
    copyright.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    copyright.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    

  }

}

