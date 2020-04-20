//
//  Coordinator.swift
//  poc
//
//  Created by Salaheddine on 18/04/2020.
//  Copyright © 2020 Salaheddine. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol : AnyObject {
    var childCoordinator : [CoordinatorProtocol] { get set}
    var navigation : UINavigationController {get set}
    func start()
}

