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
    var orders: [String: Any]?
    var ordersValue: Double!
    var mobileNumber: String!
    var username: String!
    var numberOfOrders: Int!
    var orderHistory: [String]!
    
    init(uid: String, number_of_orders: Int, ordersValue: Double, mobileNumber: String, username: String, orderHistory: [String]) {
        self.uid = uid
        self.numberOfOrders = number_of_orders
        self.ordersValue = ordersValue
        self.mobileNumber = mobileNumber
        self.username = username
        self.orderHistory = orderHistory
    }
    
    var dictValue: [String: Any] {
        return ["number_of_orders" : numberOfOrders, "ordersValue" : ordersValue, "mobileNumber": mobileNumber, "username": username, "orderHistory":orderHistory]
    }
}

