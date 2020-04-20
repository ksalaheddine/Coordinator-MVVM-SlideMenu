//
//  LoginCoordinator.swift
//  poc
//
//  Created by Salaheddine on 18/04/2020.
//  Copyright © 2020 Salaheddine. All rights reserved.
//

import UIKit

class LoginCoordinator:CoordinatorProtocol{
    var mainCoordinator : MainCoordinator?
    var childCoordinator = [CoordinatorProtocol]()
    
    var navigation: UINavigationController
    init(navigation : UINavigationController){
        self.navigation = navigation
    }
    func start() {
        let loginVC = LoginViewController.instantiate()
        navigation.isNavigationBarHidden = true
        loginVC.coordinator = self
        navigation.pushViewController(loginVC, animated: true)
    }
    
    func loginStart(email: String?,password: String?){
        mainCoordinator?.loginSuccess(self)
    }
}
