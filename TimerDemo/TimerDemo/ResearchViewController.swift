//
//  ResearchViewController.swift
//  TimerDemo
//
//  Created by Michael on 08/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class ResearchViewController: UIViewController {
    var timer:Timer?
    @IBOutlet weak var timerLabel: UILabel!
    var count = 100
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ResearchViewController.checkTime(sender:)), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
        updateLabel(count: self.count)
    }
    
    @objc func checkTime(sender:Timer) {
        print("fire")
        
        count = count - 1
        if count == 0 {
            sender.invalidate()
        }
        updateLabel(count:count)
    }
    
    func updateLabel(count:Int){
        self.timerLabel.text = "\(count)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    deinit {
        print("destroy reseach view controller")
        
    }

}
