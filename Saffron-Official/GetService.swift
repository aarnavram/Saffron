//
//  GetService.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 13/11/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import Foundation
import FirebaseDatabase

class GetService {
    
    static let sharedInstance = GetService()
    
    func getDatabaseStatus(completion: @escaping (Bool?) -> ()) {
        let dataBaseRef = Database.database().reference()
        let switchReference = dataBaseRef.child("databaseStatus")
        switchReference.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let status = snapshot.value as? String else {
                completion(nil)
                return
            }
            if (status == "off") {
                completion(false)
            } else if status == "on" {
                completion(true)
            }
        })
    }
    
}
