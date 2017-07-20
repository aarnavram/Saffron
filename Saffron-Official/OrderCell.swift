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
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descrLabel: UILabel!
    
    @IBOutlet weak var nutsLabel: UILabel!
    
    @IBOutlet weak var vegLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var containerPriceLabel: UILabel!
    @IBOutlet weak var containerDescrLabel: UILabel!
    @IBOutlet weak var containerTitleLabel: UILabel!
    @IBOutlet weak var containerImageLabel: UILabel!
    @IBOutlet weak var contentViewAddButton: UIButton!
    var category: Int = -1
    var subCategory: Int = -1
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBAction func onAddPressed(_ sender: Any) {
        let sender = sender as! UIButton
        if category <= 3 {
            let foodItem = OfflineClient.sharedInstance.foodCategoryArray[category][subCategory][sender.tag]
            print(foodItem)
            //CartViewController.finalCart.append(foodItem.food)
        } else {
            let drinkItem = OfflineClient.sharedInstance.drinkCategoryArray[category - 4][subCategory][sender.tag]
            print(drinkItem)
            //CartViewController.finalCart.append(drinkItem.drink)
        }
    }
    
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }

}
