//
//  protocol.swift
//  GetItDone
//
//  Created by George Shafik on 10/7/19.
//  Copyright © 2019 George Shafik. All rights reserved.
//

import Foundation

protocol GDHeaderDelegate {
  func openAddItemPopup()
}

protocol GDNewItemDelegate {
  func addItemToList()
}
