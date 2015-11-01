//
//  addStepCell.swift
//  elme
//
//  Created by Margaret Bignell on 10/31/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class AddStepCell: UITableViewCell {

    
    @IBOutlet weak var stepNumberLabel: UILabel!
    @IBOutlet weak var addStepTextField: StepField!
    @IBOutlet weak var topBorder: UIView!
    @IBOutlet weak var bottomBorder: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
