//
//  CartViewController.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 09/06/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit
import FirebaseDatabase


class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    static var finalCart = [Any]()
    
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        let backImageView = UIImageView()
        backImageView.image = UIImage(named: "transparentDishBack")
        backImageView.contentMode = .scaleAspectFill
        tableView.backgroundView = backImageView
        
        placeOrderButton.layer.cornerRadius = 25
        totalView.layer.cornerRadius = 20
        self.view.backgroundColor = UIColor.init(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        self.tableView.backgroundColor = UIColor.init(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        self.tableView.separatorStyle = .none
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if CartViewController.finalCart.count == 0 {
            self.tableView.isHidden = true
            self.totalLabel.text = "Total : P 0"
            self.placeOrderButton.isHidden = true
            self.emptyLabel.isHidden = false
        } else {
            
            //FIX TOTAL LABEL TEXT
            var sum = 0;
            for item in 0...CartViewController.finalCart.count - 1 {
                if let drink = CartViewController.finalCart[item] as? Drink {
                    sum = sum + Int(drink.price.replacingOccurrences(of: "P", with: ""))!
                } else if let food = CartViewController.finalCart[item] as? Food {

                    sum = sum + Int(food.price.replacingOccurrences(of: "P", with: ""))!
                }
            }
            self.tableView.isHidden = false
            self.placeOrderButton.isHidden = false
            self.placeOrderButton.isUserInteractionEnabled = true
            self.emptyLabel.isHidden = true
            self.totalLabel.text = "Total : P \(sum)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPressOrderButtonPressed(_ sender: Any) {
        
//        let databseRef = Database.database().reference().child(AppUser.currentUser.uid).child("pending")
//        
//        databseRef.updateChildValues(["order": CartViewController.finalCart]) { (error : Error?, ref : DatabaseReference) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                print(ref)
//            }
//        }
        
        
        
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func OnXPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

extension CartViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartViewController.finalCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "finalCartTableViewCell", for: indexPath) as! FinalCartTableViewCell
        cell.outerView.layer.cornerRadius = 10
        cell.backgroundColor = UIColor.clear
        if let drink = CartViewController.finalCart[indexPath.row] as? Drink {
            cell.titleLabel.text = drink.drink
            cell.priceLabel.text = drink.price
        } else if let food = CartViewController.finalCart[indexPath.row] as? Food {

            cell.titleLabel.text = food.food
            cell.priceLabel.text = food.price
        }
   

        return cell
    }
    
}
