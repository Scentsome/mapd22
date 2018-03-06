//
//  ViewController.swift
//  IIIDemo
//
//  Created by Michael on 06/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let contents:String?
        let filePath = "/Users/michael/Desktop/tmp/class.txt"
        do {
            contents =  try String(contentsOfFile: filePath, encoding: String.Encoding.utf8)
            
            
            print("success", contents)
        } catch {
           print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

