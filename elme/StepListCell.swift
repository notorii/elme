//
//  StepListCell.swift
//  elme
//
//  Created by Margaret Bignell on 10/28/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class StepListCell: UITableViewCell {

    @IBOutlet weak var stepNumberLabel: UILabel!
    @IBOutlet weak var stepTextLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
