//
//  FinalCartTableViewCell.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 08/07/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit

protocol RemoveDelegate: class {
    func remove(at index:Int)
}
class FinalCartTableViewCell: UITableViewCell {
    
    weak var delegate: RemoveDelegate?

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var outerView: UIView!
    
    @IBOutlet weak var removeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func onRemoveButtonPressed(_ sender: UIButton) {
        delegate?.remove(at: sender.tag)
    }

}
