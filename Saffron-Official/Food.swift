//
//  Food.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 05/06/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit

class Food: NSObject {
    var food: String!
    var descr: String!
    var price: String!
    var nuts: Bool!
    
    init(food: String, description: String, price: String, nuts: Bool) {
        self.food = food
        self.descr = description
        self.price = price
        self.nuts = nuts
    }
}
