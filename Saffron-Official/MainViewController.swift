//
//  MainViewController.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 05/04/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NSLayoutConstraint(item: indianLabel, attribute: .centerY, relatedBy: .equal, toItem: indian, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: chineseLabel, attribute: .centerY, relatedBy: .equal, toItem: chinese, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: fusionLabel, attribute: .centerY, relatedBy: .equal, toItem: fusion, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: dessertLabel, attribute: .centerY, relatedBy: .equal, toItem: dessert, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: beveragesLabel, attribute: .centerY, relatedBy: .equal, toItem: beverages, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: wineLabel, attribute: .centerY, relatedBy: .equal, toItem: wineList, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func onIndianPressed(_ sender: Any) {
        animate(tag: 0)
    }
    
    @IBAction func onChinesePressed(_ sender: Any) {
        animate(tag: 1)
    }
    
    @IBAction func onFusionPressed(_ sender: Any) {
        animate(tag: 2)
    }
    
    @IBAction func onDessertPressed(_ sender: Any) {
        animate(tag: 3)

    }
    
    @IBAction func onBeveragesPressed(_ sender: Any) {
        animate(tag: 4)
    }

    @IBAction func onWinePressed(_ sender: Any) {
        animate(tag: 5)
    }

    
    func animate(tag: Int) {
        UIView.animate(withDuration: 0.65) {
            self.imgViewArr[tag].center.x -= (self.imgViewArr[tag].frame.width)
            self.labelArr[tag].center.x -= (self.imgViewArr[tag].frame.width)
        }
        self.performSegue(withIdentifier: "seg2", sender: nil)
        print(tag)
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


