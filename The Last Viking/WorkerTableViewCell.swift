//
//  WorkerTableViewCell.swift
//  The Last Viking
//
//  Created by Christian Vila on 7/24/17.
//  Copyright © 2017 NAPPS. All rights reserved.
//

import UIKit

class WorkerTableViewCell: UITableViewCell {
    @IBOutlet var typeOfWorker: UILabel!
    @IBOutlet var numOfWorkers: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
