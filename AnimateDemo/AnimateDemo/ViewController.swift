//
//  ViewController.swift
//  AnimateDemo
//
//  Created by Michael on 02/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginLabel:UILabel!
    
    
    
    @IBOutlet weak var accountField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        print(self.accountField.frame)
        let toRight = CAKeyframeAnimation(keyPath: "position")
//        toRight.damping = 10.0
//        toRight.fromValue = 0
//        toRight.toValue = 200
        
        toRight.values = [CGPoint(x:0,y:0),CGPoint(x:100,y:100),CGPoint(x:96+93.5,y:98+15)].map({ NSValue(cgPoint:$0)
        })
        
        toRight.keyTimes = [0,0.5,1.0]
        toRight.duration = 0.5
        toRight.delegate = self
//        toRight.autoreverses = true

        toRight.setValue(self.loginLabel.layer, forKey: "loginLayer")
        self.accountField.layer.add(toRight, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//extension ViewController : UITableViewDataSource {
//    
//}

extension ViewController : CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        print("animation stop")
        
        let loginLayer:CALayer? = anim.value(forKey: "loginLayer") as? CALayer
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.fromValue = 1.5
        pulse.toValue = 1.0
        pulse.duration = 0.5
        loginLayer?.add(pulse, forKey: nil)
    }
}

