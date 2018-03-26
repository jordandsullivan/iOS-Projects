//
//  TableViewCell.swift
//  PokedexLab
//
//  Created by Jordan Sullivan on 10/23/17.
//  Copyright © 2017 iOS Decal. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel?
    @IBOutlet weak var Number: UILabel?
    @IBOutlet weak var Stats: UILabel?
    @IBOutlet weak var Pic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
