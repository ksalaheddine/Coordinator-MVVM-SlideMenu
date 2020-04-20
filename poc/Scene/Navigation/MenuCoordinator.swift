//
//  MenuCoordinator.swift
//  poc
//
//  Created by Salaheddine on 19/04/2020.
//  Copyright © 2020 Salaheddine. All rights reserved.
//


import UIKit

class MenuCoordinator:NSObject, CoordinatorProtocol{
    var mainCoordinator : MainCoordinator?
    var childCoordinator = [CoordinatorProtocol]()
    let transition = SlideInTransition()
    
    var navigation: UINavigationController
    init(navigation : UINavigationController){
        self.navigation = navigation
    }
    func start() {
        let menuVC = MenuTableViewController.instantiate()
        transition.delegate = menuVC
        menuVC.coordinator = self
        menuVC.menuItems = FetchMenu.fetchMenu()
    //    navigation.pushViewController(menuVC, animated: true)
        
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.transitioningDelegate = self
   
        navigation.present(menuVC,animated: true)
    }
    
    @objc func home(){

        mainCoordinator?.home()

    }
    @objc func health(){

        mainCoordinator?.health()

    }
    

}

extension MenuCoordinator: UIViewControllerTransitioningDelegate{
     func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
}
