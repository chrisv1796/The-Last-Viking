//
//  TroopsTableViewCell.swift
//  The Last Viking
//
//  Created by Christian Vila on 7/21/17.
//  Copyright © 2017 NAPPS. All rights reserved.
//

import UIKit




class TroopsTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var troopTypeLabel: UILabel!
    @IBOutlet weak var troopCountLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
