//
//  ListController.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class ListController: UIViewController, GDHeaderDelegate {
  func addItem() {
    print("trying to add item from header")
  }
  

  let header = GDHeaderView(title: "Stuff to get done", subtitle: "4 left")
  
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
    
      view.addSubview(header)
      //header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
      header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
      header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
      header.heightAnchor.constraint(equalToConstant: 120).isActive = true
      
      header.delegate = self
    }  
}
