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

class AppUser {
    
    static var currentUser: AppUser!
    
    var uid: String!
    
    init(_ uid: String) {
        self.uid = uid
    }
}

