//
//  ViewController.swift
//  ReviewMVC_swift
//
//  Created by Michael on 01/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

enum ViewTag {
    case blue
}


class ViewController: UIViewController {
    @IBAction func moveView(_ sender: Any) {
//        UIView.animate(withDuration: 1.0) {
//            self.grayView.center = CGPoint(x:200,y:300)
//        }
        UIView.animate(withDuration: 1.0, animations: {
            self.grayView.center = CGPoint(x:200,y:300)
        }) { (finish) in
            UIView.animate(withDuration: 1.0) {
            self.grayView.center = CGPoint(x:200,y:500)
            }
        }
    }
    
    @IBOutlet weak var grayView: GrayView!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textField1: UITextField!
    
    
    
    
    @IBAction func removeView(_ sender: Any) {
        var blueView:UIView? = self.view.viewWithTag(100)
        
        blueView?.removeFromSuperview()
        
        self.textField1.resignFirstResponder()
        
    }
    
    @IBAction func addView(_ sender: Any) {
        var blueView = UIView()
        blueView.tag = 100
        blueView.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        blueView.backgroundColor = UIColor.blue
        self.view.addSubview(blueView)
    }
    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        print("awake vc")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.textField1.becomeFirstResponder()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        segue.identifier
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch view controller")
        textField1.resignFirstResponder()
//        self.view.endEditing(true)
    }

}

