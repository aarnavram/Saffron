//
//  Drink.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 05/06/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit

class Drink: NSObject {
    
    var drink: String!
    var descr: String!
    var price: String!
    
    init(drink: String, description: String, price: String) {
        self.drink = drink
        self.descr = description
        self.price = price
    }

}
