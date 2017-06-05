//
//  OrderCell.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 05/06/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit
import FoldingCell

class OrderCell: FoldingCell {

    @IBOutlet weak var foreView: RotatedView!
    @IBOutlet weak var contView: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBAction func onAddPressed(_ sender: Any) {
        
        print("Tapped")
    }
    
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }

}
