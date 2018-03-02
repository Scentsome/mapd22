//
//  MyLabel.swift
//  ReviewMVC_swift
//
//  Created by Michael on 01/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class MyLabel: UILabel {

    override func awakeFromNib() {
        print("awake mylabel")
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.cornerRadius = 10.0
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
