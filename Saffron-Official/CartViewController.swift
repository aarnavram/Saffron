//
//  CartViewController.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 09/06/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    static var finalCart = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(CartViewController.finalCart)
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
