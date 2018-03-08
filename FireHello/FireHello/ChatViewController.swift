//
//  ChatViewController.swift
//  FireHello
//
//  Created by Michael on 08/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController {
    var roomName:String?
   


    override func viewDidLoad() {
        super.viewDidLoad()
        var channelRef: DatabaseReference? = Database.database().reference().child("channels")
        var roomName: String? = "Chat"
        title = roomName
//        self.senderId = Auth.auth().currentUser?.uid
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
