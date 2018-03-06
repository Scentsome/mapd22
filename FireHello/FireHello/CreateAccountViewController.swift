//
//  CreateAccountViewController.swift
//  FireHello
//
//  Created by Michael on 06/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var accountField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func createAccount(_ sender: Any) {
        Auth.auth().createUser(withEmail: accountField.text!, password: passwordField.text!) { (user, error) in
            if error == nil {
                let alertController = UIAlertController(title: "Success", message:"You have successfully signed up",
                    preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                    self.dismiss(animated: true, completion: nil)
                })
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription,
                                                        preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }

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

}
