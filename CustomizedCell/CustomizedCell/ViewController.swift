//
//  ViewController.swift
//  CustomizedCell
//
//  Created by Michael on 05/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showGrayVC(_ sender: Any) {
        
        let grayVC = self.storyboard?.instantiateViewController(withIdentifier: "GrayVC")
        
        self.addChildViewController(grayVC!)
        self.transition(from: self.childViewControllers[0], to: grayVC!, duration: 1.0, options: .transitionFlipFromLeft, animations: nil){ finished in

            grayVC?.didMove(toParentViewController: self)
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(childViewControllers)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:MyViewCell? = tableView.dequeueReusableCell(withIdentifier: "Cell") as? MyViewCell
        
        cell?.cellIndexPath = indexPath
        cell?.delegate = self
        return cell!
    }
}

extension ViewController : MyViewCellDelegate {
    func didSelectInnerBtn(indexPath: IndexPath) {
        
    }
}

