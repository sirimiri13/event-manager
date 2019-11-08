//
//  MyCell.swift
//  midterm
//
//  Created by Lam Huong on 11/7/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var section: UILabel!
    @IBOutlet weak var table: UILabel!
    @IBOutlet weak var guest: UILabel!
    @IBOutlet weak var nameText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
