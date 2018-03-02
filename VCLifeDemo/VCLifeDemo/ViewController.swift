//
//  ViewController.swift
//  VCLifeDemo
//
//  Created by Michael on 02/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func logout(_ sender: Any) {
        var loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        
        var userDefaults = UserDefaults.standard
        userDefaults.set(false, forKey: "IsLogined")
        userDefaults.synchronize()
        dismiss(animated: true, completion: nil)
        present(loginVC!, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        var userDefaults = UserDefaults.standard
        
        var isLogined:Bool = userDefaults.bool(forKey: "IsLogined")
        
        if !isLogined {
            var loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
            
            present(loginVC!, animated: true, completion: nil)
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("got memory warning..")
        
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator){
        print("viewWillTransitionToSize",size)
    }
    

}

