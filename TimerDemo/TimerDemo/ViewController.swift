//
//  ViewController.swift
//  TimerDemo
//
//  Created by Michael on 08/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func downloadImage(_ sender: Any) {
        
        var url = URL(string: "https://c1.staticflickr.com/3/2484/3567074965_30eae5f224_o.jpg")
        
        let myQueue = DispatchQueue.global()
        myQueue.async {
            do {
                let data =  try Data(contentsOf: url!)
                var image = UIImage(data: data)
                
                DispatchQueue.main.async{
                    self.imageView.image = image
                }
            } catch {
                
            }
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let myQueue = DispatchQueue(label: "com.scentsome")
        
//        let myQueue = DispatchQueue.global()
        myQueue.async {
            print("heavy work1÷")
        }
        
        myQueue.async {
            print("heavy work2")
        }
        
        myQueue.async {
            print("heavy work3")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func home(segue:UIStoryboardSegue){
        
    }

}

