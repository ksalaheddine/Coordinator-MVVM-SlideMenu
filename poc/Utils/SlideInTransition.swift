//
//  SlideTransition.swift
//  poc
//
//  Created by Salaheddine on 18/04/2020.
//  Copyright © 2020 Salaheddine. All rights reserved.
//
import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {

    
    weak var delegate: DimViewTouchDetectedProtocol?
    var isPresenting = false
    let dimmingView = UIView()

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    @objc func dismis(_ viewController : UIViewController){
        viewController.dismiss(animated: true)
    }
    @objc func touchWasDetected() {
        delegate?.close()
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else { return }

        let containerView = transitionContext.containerView

        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.height

        if isPresenting {

            // Add dimming view
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchWasDetected))
            dimmingView.addGestureRecognizer(tapGesture)
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
         
            // Add menu view controller to container
            containerView.addSubview(toViewController.view)

            // Init frame off the screen
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }

        // Move on screen
        let transform = {
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }


        // Move back off screen
        let identity = {
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform = .identity
        }

        // Animation of the transition
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
    }

}

protocol DimViewTouchDetectedProtocol: AnyObject {
func close()
}
