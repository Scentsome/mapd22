//
//  LoginViewController.swift
//  VCLifeDemo
//
//  Created by Michael on 02/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var account: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func login(_ sender: Any) {
        
        if account.text == "abc" && password.text == "123"{
            
             var userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "IsLogined")
            userDefaults.synchronize()
            dismiss(animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator){
        print("size: \(size.width), \(size.height)")
        
        if size.width > size.height{
            print("landscape")
            
        } else if size.width < size.height{
            print("portrait")
            
        } else {
            print("Unknow")
        }
    }


}
