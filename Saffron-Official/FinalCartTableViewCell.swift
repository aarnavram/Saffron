//
//  FinalCartTableViewCell.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 08/07/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit

class FinalCartTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var outerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
