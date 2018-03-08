//
//  ViewController.swift
//  firebaseChatroom
//
//  Created by cora on 2018/3/6.
//  Copyright © 2018年 cora. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    var senderDisplayName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LoginDidTouch(_ sender: Any) {
        if nameField?.text != "" {
            senderDisplayName = nameField.text
            Auth.auth().signInAnonymously(completion: { (user, error) in
                if let err = error {
                    print(err.localizedDescription)
                    return
                }
                
                self.performSegue(withIdentifier: "LoginToChatSegue", sender: nil)
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
            let chatVc = segue.destination as! ChatViewController
            
            chatVc.senderDisplayName = senderDisplayName
//            chatVc.channel = channel
//            chatVc.channelRef = channelRef.child(channel.id)
        
    }
    

    
}

