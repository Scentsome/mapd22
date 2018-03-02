//
//  GrayViewController.swift
//  VCTransition
//
//  Created by Michael on 20/01/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class GrayViewController: UIViewController,UIViewControllerTransitioningDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
//        segue.destination.modalPresentationStyle = .custom

    }
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
            
            return BounceController()
            
    }
 

}
