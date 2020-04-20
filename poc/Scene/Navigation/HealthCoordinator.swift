//
//  HealthCoordinator.swift
//  poc
//
//  Created by Salaheddine on 18/04/2020.
//  Copyright © 2020 Salaheddine. All rights reserved.
//

import UIKit

class HealthCoordinator: CoordinatorProtocol {
    var childCoordinator = [CoordinatorProtocol]()
    var mainCoordinator : MainCoordinator?
    var navigation: UINavigationController
    init(navigation : UINavigationController){
        self.navigation = navigation
    }
    func start() {
        let healthVC = HealthViewController.instantiate()
        healthVC.coordinator = self
        navigation.isNavigationBarHidden = false
        healthVC.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "LeftMenu"), style: .plain, target: self.mainCoordinator, action: #selector(mainCoordinator?.menu))
        navigation.pushViewController(healthVC, animated: true)
   
        }
    
    
    
    
}
