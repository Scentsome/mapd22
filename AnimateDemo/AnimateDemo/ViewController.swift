//
//  ViewController.swift
//  AnimateDemo
//
//  Created by Michael on 02/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var accountField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        let toRight = CABasicAnimation(keyPath: "position.x")
        toRight.fromValue = 0
        toRight.toValue = 200
        toRight.duration = 0.5
        self.accountField.layer.add(toRight, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

