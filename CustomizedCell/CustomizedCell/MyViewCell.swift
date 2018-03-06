//
//  MyViewCell.swift
//  CustomizedCell
//
//  Created by Michael on 05/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
protocol MyViewCellDelegate {
    func didSelectInnerBtn(indexPath:IndexPath)
}


class MyViewCell: UITableViewCell {
    var delegate:MyViewCellDelegate?
    var cellIndexPath:IndexPath?
    @IBOutlet weak var cellLabel: UILabel!
    @IBAction func pressBtn(_ sender: Any) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
