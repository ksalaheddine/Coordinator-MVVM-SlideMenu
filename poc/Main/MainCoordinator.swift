//
//  MainCoordinator.swift
//  poc
//
//  Created by Salaheddine on 18/04/2020.
//  Copyright © 2020 Salaheddine. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, CoordinatorProtocol,UINavigationControllerDelegate{
 
    
    // MARK: Conform to protocol Coordinator
    var childCoordinator = [CoordinatorProtocol]()
    var navigation: UINavigationController
  
    init(navigation : UINavigationController){
        self.navigation = navigation

    }
    
    func start() {
        navigation.delegate = self
        configureNavigationBar()
        login()
    }
    
   @objc func menu(){
        let child = MenuCoordinator(navigation: navigation)
        child.mainCoordinator = self
               childCoordinator.append(child)
               child.start()
        
    }
    
    //MARK: Connexion scenario
    
    func loginSuccess(_ child:LoginCoordinator?){
        childDidFinish(child)
        health()
    }
    
    // MARK: Childs start work trigger
  func login(){
        let child = LoginCoordinator(navigation: navigation)
        child.mainCoordinator = self
               childCoordinator.append(child)
               child.start()
    }
  func health(){
        let child = HealthCoordinator(navigation: navigation)
      child.mainCoordinator = self
               childCoordinator.append(child)
               child.start()
    }
 func home(){
        let child = HomeCoordinator(navigation: navigation)
        child.mainCoordinator = self
               childCoordinator.append(child)
               child.start()
    }
    
    
    // MARK: Delete child from the list
    func childDidFinish(_ child: CoordinatorProtocol?){
          for (index, coordinator) in childCoordinator.enumerated(){
              if coordinator === child{
                  childCoordinator.remove(at: index)
           
              }
          }
      }
      
   func configureNavigationBar(){
          navigation.navigationBar.barTintColor = .lightGray
          navigation.navigationBar.barStyle = .black
          
      }

}
