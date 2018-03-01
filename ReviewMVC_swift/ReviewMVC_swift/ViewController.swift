//
//  ViewController.swift
//  ReviewMVC_swift
//
//  Created by Michael on 01/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        print("awake vc")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
   
       print("view did load")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//            UIApplication.shared.isStatusBarHidden = true
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidShow, object: nil, queue: nil) { (noti) in
            print("\(noti)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func home(segue:UIStoryboardSegue){
        
    }

}

