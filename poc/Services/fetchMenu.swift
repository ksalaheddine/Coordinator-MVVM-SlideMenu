//
//  fetchMenu.swift
//  poc
//
//  Created by Salaheddine on 19/04/2020.
//  Copyright © 2020 Salaheddine. All rights reserved.
//

import UIKit

class FetchMenu {
  static  func fetchMenu() -> LeftSide? {
        if let path = Bundle.main.path(forResource: "menuItems", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let menuVM = try JSONDecoder().decode(LeftSide.self, from: data)
                return menuVM
            } catch {
                NSLog("\(error)")
                return nil
            }
        }
        return nil
    }
}
