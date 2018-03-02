//
//  BounceController.swift
//  CustomTransition
//
//  Created by Michael Pan on 2016/7/27.
//  Copyright © 2016年 Zencher. All rights reserved.
//

import UIKit

class BounceController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewController(forKey: .to )
        let finalFrame = transitionContext.finalFrame(for: toVC!)
        
        let containerView = transitionContext.containerView
        
        let screenBounds = UIScreen.main.bounds
        
        toVC!.view.frame = finalFrame.offsetBy(dx: 0, dy: screenBounds.size.height)
        containerView.addSubview((toVC?.view)!)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveLinear, animations: {
            toVC!.view.frame = finalFrame
        }) { (finished:Bool) in
            transitionContext.completeTransition(true)
        }
//        UIView.animate(withDuration: duration, animations: {
//            toVC!.view.frame = finalFrame
//        }) { (finished:Bool) in
//                transitionContext.completeTransition(true)
//        }
        
        
    }

}
