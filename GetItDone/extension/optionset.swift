//
//  optionset.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import Foundation

struct ButtonOptions: OptionSet {
  let rawValue : Int
  
  static let roundedText = ButtonOptions(rawValue: 1 << 10)
  static let squareIcon = ButtonOptions(rawValue: 1 << 1)
}
