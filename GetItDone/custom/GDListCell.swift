//
//  GDListCell.swift
//  GetItDone
//
//  Created by George Shafik on 11/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import UIKit

class GDListCell:UITableViewCell {
  
  var toDo:ToDo? {
    didSet {
      if let toDo = toDo {
        print(toDo.status)
        
        self.textLabel?.text = toDo.title
      }
    }
  }
  
 
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    selectionStyle = .none
    backgroundColor = .white
    textLabel?.textColor = .grayZero        
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
