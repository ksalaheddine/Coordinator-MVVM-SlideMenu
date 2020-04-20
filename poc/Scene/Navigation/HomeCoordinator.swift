//
//  HomeCoordinator.swift
//  poc
//
//  Created by Salaheddine on 18/04/2020.
//  Copyright © 2020 Salaheddine. All rights reserved.
//

import UIKit

class HomeCoordinator:CoordinatorProtocol {
    var mainCoordinator: MainCoordinator?
    var childCoordinator =  [CoordinatorProtocol]()
    
    var navigation: UINavigationController
    init(navigation : UINavigationController){
        self.navigation = navigation
    }
    func start() {
        let homeVC = HomeViewController.instantiate()
        navigation.isNavigationBarHidden = false
        homeVC.coordinator = self
        homeVC.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "LeftMenu"), style: .plain, target: self.mainCoordinator, action: #selector(mainCoordinator?.menu))
               navigation.pushViewController(homeVC, animated: true)
   
    }
    
    
}
