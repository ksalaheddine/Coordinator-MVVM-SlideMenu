//
//  Menu.swift
//  poc
//
//  Created by Salaheddine on 19/04/2020.
//  Copyright © 2020 Salaheddine. All rights reserved.
//

import UIKit

struct LeftSide: Codable
{
    var menuItems : [MenuItem]?
}
struct MenuItem: Codable{
        var sectionName:String?
        var items:[Item]?
    }
    struct Item: Codable {
        var iD  :   UInt?
        var title:String?
        var icon:String?
        var controller:String?
        var onLogin = false
    }
  

struct LeftSideVM
{
    var menuItems : [MenuItem]?
    init(_ leftSide:LeftSide){
        self.menuItems = leftSide.menuItems
    }
}
