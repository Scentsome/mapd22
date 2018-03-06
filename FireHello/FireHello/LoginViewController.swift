//
//  LoginViewController.swift
//  FireHello
//
//  Created by Michael on 06/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var account: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.account.text!,
                           password: self.password.text!)
        { (user, error) in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
                print("\(user?.email)")
                var defaults = UserDefaults.standard
                
                defaults.set(user?.email, forKey: "email")
                defaults.synchronize()
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "YoVC")
//                self.present(vc!, animated: true, completion: nil)
            } else {
                print("login fail\(user)")
                let alertController = UIAlertController(title: "Error",
                                                        message: error?.localizedDescription,
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
    @IBAction func resetPassword(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: self.account.text!, completion: { (error) in
            var title = ""
            var message = ""
            if error != nil {
                title = "Error!"
                message = (error?.localizedDescription)!
            } else {
                title = "Success!"
                message = "Password reset email sent."
                self.account.text = ""
            }
            let alertController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        })
    }
    
}
