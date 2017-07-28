//
//  User.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 19/07/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

struct User {
    
    var uid: String!
    var orders: Int!
    var ordersValue: Double!
    var mobileNumber: String!
    var username: String!
    
    init(uid: String, orders: Int, ordersValue: Double, mobileNumber: String, username: String) {
        self.uid = uid
        self.orders = orders
        self.ordersValue = ordersValue
        self.mobileNumber = mobileNumber
        self.username = username
    }
    
    var dictValue: [String: Any] {
        return ["orders": orders, "ordersValue" : ordersValue, "mobileNumber": mobileNumber, "username": username]
    }
}

