//
//  GrayView.swift
//  ReviewMVC_swift
//
//  Created by Michael on 02/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit

class GrayView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touch gray view")
//    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch moved on gray view")
    }

}
