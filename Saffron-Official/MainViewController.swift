//
//  MainViewController.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 05/04/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit
import SCLAlertView

class MainViewController: UIViewController {
    

    @IBOutlet weak var cartLabel: UILabel!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var indian: UIImageView!
    @IBOutlet weak var chinese: UIImageView!
    @IBOutlet weak var fusion: UIImageView!
    @IBOutlet weak var dessert: UIImageView!
    @IBOutlet weak var beverages: UIImageView!
    @IBOutlet weak var wineList: UIImageView!
    var imgViewArr = [UIImageView]()
    var labelArr = [UILabel]()
    
    @IBOutlet weak var indianLabel: UILabel!
    @IBOutlet weak var chineseLabel: UILabel!
    @IBOutlet weak var fusionLabel: UILabel!
    @IBOutlet weak var dessertLabel: UILabel!
    @IBOutlet weak var beveragesLabel: UILabel!
    @IBOutlet weak var wineLabel: UILabel!
    
    var senderTag = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartLabel.text = "Cart : \(CartViewController.finalCart.count)"
        imgViewArr.append(indian)
        imgViewArr.append(chinese)
        imgViewArr.append(fusion)
        imgViewArr.append(dessert)
        imgViewArr.append(beverages)
        imgViewArr.append(wineList)
        labelArr.append(indianLabel)
        labelArr.append(chineseLabel)
        labelArr.append(fusionLabel)
        labelArr.append(dessertLabel)
        labelArr.append(beveragesLabel)
        labelArr.append(wineLabel)
        //self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func cartInfoAlert() {
        let appearance = SCLAlertView.SCLAppearance(kCircleHeight: 50, kCircleIconHeight: 50, showCircularIcon: true)
        let alertView = SCLAlertView(appearance: appearance)
        let alertIcon = UIImage(named: "logoWithoutBG")
        alertView.showTitle("To View Your Order", subTitle: "Click the cart button in the top right corner", duration: nil, completeText: "OK", style: .warning, colorStyle: 0x000000, colorTextButton: 0xFFFFFF, circleIconImage: alertIcon, animationStyle: .rightToLeft)
        //alertView.showEdit("LOL", subTitle: "LOL")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartLabel.text = "Cart : \(CartViewController.finalCart.count)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let cartInfo = UserDefaults.standard.object(forKey: "showCartInfo") as? Bool {
            if cartInfo == true {
                cartInfoAlert()
                UserDefaults.standard.set(false, forKey: "showCartInfo")
                UserDefaults.standard.synchronize()
            }
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func onIndianPressed(_ sender: Any) {
        senderTag = 0
        animate(tag: 0)
    }
    
    @IBAction func onChinesePressed(_ sender: Any) {
        senderTag = 1
        animate(tag: 1)
    }
    
    @IBAction func onFusionPressed(_ sender: Any) {
        senderTag = 2
        animate(tag: 2)
    }
    
    @IBAction func onDessertPressed(_ sender: Any) {
        senderTag = 3
        animate(tag: 3)

    }
    
    @IBAction func onBeveragesPressed(_ sender: Any) {
        senderTag = 4
        animate(tag: 4)
    }

    @IBAction func onWinePressed(_ sender: Any) {
        senderTag = 5
        animate(tag: 5)
    }

    
    func animate(tag: Int) {
        UIView.animate(withDuration: 0.35) {
            self.imgViewArr[tag].center.x -= (self.imgViewArr[tag].frame.width)
            self.labelArr[tag].center.x -= (self.imgViewArr[tag].frame.width)
        }
        self.performSegue(withIdentifier: "seg2", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seg2" {
            
            let destination = segue.destination as! CategoriesViewController
            destination.category = senderTag
        }
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


