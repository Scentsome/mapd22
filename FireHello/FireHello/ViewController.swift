//
//  ViewController.swift
//  FireHello
//
//  Created by Michael on 06/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var textField: UITextField!
//    var ref:DatabaseReference?

    @IBOutlet weak var message: UITextField!
    @IBAction func logout(_ sender: Any) {
        var defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.synchronize()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        var refHandle = ref.observe(DataEventType.value, with: { (snapshot) in
//            let postDict = snapshot.value as? [String : String]
//            self.label.text = postDict?["OnClass"]
//        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var defaults = UserDefaults.standard
        var email = defaults.value(forKey: "email")
        if email == nil {
 //           let loginVC  = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
//            present(loginVC!, animated: true, completion: nil)
            
            performSegue(withIdentifier: "LogoutSegue", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func home(segue:UIStoryboardSegue){
        

    }
    
    @IBAction func sendToFire(_ sender: Any) {
        var ref = Database.database().reference()

        ref.setValue(["OnClass": textField.text])
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(" prepare segue", sender)
    }
    @IBAction func addRef(_ sender: Any) {
        
//        ref.child("message")
    }
    
}

