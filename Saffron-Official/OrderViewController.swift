//
//  OrderViewController.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 05/06/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit
import FoldingCell

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var category = -1
    var subCategory = -1
    let kCloseCellHeight: CGFloat = 117 //double space + height of closed
    let kOpenCellHeight: CGFloat = 330 //height + 9
    var kRowsCount = 5
    var cellHeights: [CGFloat] = []
    var colorArray = [UIColor.init(red: 226/255, green: 117/255, blue: 41/255, alpha: 1), UIColor.init(red: 61/255, green: 187/255, blue: 62/255, alpha: 1), UIColor.init(red: 143/255, green: 1/255, blue: 2/255, alpha: 1)]
    var imageLabelArray = ["Ⓘ", "ⓒ", "Ⓕ", "Ⓓ", "Ⓑ", "ⓦ"]
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("Cat1 = \(category) Cat2 = \(subCategory)")
        if (category <= 3 && category >= 0) {
            kRowsCount = OfflineClient.sharedInstance.foodCategoryArray[category][subCategory].count
        } else if (category == 4 || category == 5) {
            kRowsCount = OfflineClient.sharedInstance.drinkCategoryArray[category - 4][subCategory].count
        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
        setup()
        tableView.backgroundColor = UIColor.init(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        tableView.separatorStyle = .none
        let backImageView = UIImageView()
        backImageView.image = UIImage(named: "transparentDishBack")
        backImageView.contentMode = .scaleAspectFill
        tableView.backgroundView = backImageView
        print(subCategory)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kRowsCount
    }
    
    private func setup() {
        cellHeights = Array(repeating: kCloseCellHeight, count: kRowsCount)
        tableView.estimatedRowHeight = kCloseCellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
        
        if cell.isAnimating() {
            return
        }
        
        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == kCloseCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { _ in tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if case let cell as FoldingCell = cell {
            cell.backgroundColor = UIColor.clear
            if cellHeights[indexPath.row] == kCloseCellHeight {
                cell.selectedAnimation(false, animated: false, completion:nil)
            } else {
                cell.selectedAnimation(true, animated: false, completion: nil)
            }
            //cell.number = indexPath.row
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! OrderCell
        cell.addButton.tag = indexPath.row
        cell.category = self.category
        cell.subCategory = self.subCategory
        cell.foreView.layer.cornerRadius = 20
        cell.contView.layer.cornerRadius = 20
        cell.foreView.clipsToBounds = true
        cell.contView.clipsToBounds = true
        cell.addButton.backgroundColor = UIColor.init(red: 162/255, green: 0/255, blue: 19/255, alpha: 1)
        cell.contentViewAddButton.backgroundColor = UIColor.init(red: 162/255, green: 0/255, blue: 19/255, alpha: 1)
        cell.contentViewAddButton.layer.cornerRadius = 20
        
        if category >= 0 && category <= 3 {
            cell.containerImageLabel.text = imageLabelArray[category]
            cell.containerImageLabel.textColor = colorArray[Int(arc4random_uniform(3))]
            cell.titleLabel.text = OfflineClient.sharedInstance.foodCategoryArray[category][subCategory][indexPath.row].food.uppercased()
            cell.descrLabel.text = OfflineClient.sharedInstance.foodCategoryArray[category][subCategory][indexPath.row].descr
            cell.priceLabel.text = OfflineClient.sharedInstance.foodCategoryArray[category][subCategory][indexPath.row].price
            cell.containerTitleLabel.text = OfflineClient.sharedInstance.foodCategoryArray[category][subCategory][indexPath.row].food.uppercased()
            cell.containerDescrLabel.text = OfflineClient.sharedInstance.foodCategoryArray[category][subCategory][indexPath.row].descr
            cell.containerPriceLabel.text = OfflineClient.sharedInstance.foodCategoryArray[category][subCategory][indexPath.row].price
            
            if OfflineClient.sharedInstance.foodCategoryArray[category][subCategory][indexPath.row].nuts == false {
                cell.nutsLabel.isHidden = true
            }
            if !(category == 0 && (subCategory == 1 || subCategory == 5)) {
                cell.vegLabel.isHidden = true
            }
            if OfflineClient.sharedInstance.foodCategoryArray[category][subCategory][indexPath.row].food.lowercased().contains("veg") {
                cell.vegLabel.isHidden = false
            }
        } else if category >= 4 {
            cell.containerImageLabel.text = imageLabelArray[category]
            var color = colorArray[Int(arc4random_uniform(3))]
            cell.containerImageLabel.textColor = color
            cell.titleLabel.text = OfflineClient.sharedInstance.drinkCategoryArray[category - 4][subCategory][indexPath.row].drink.uppercased()
            cell.descrLabel.text = OfflineClient.sharedInstance.drinkCategoryArray[category - 4][subCategory][indexPath.row].descr
            cell.priceLabel.text = OfflineClient.sharedInstance.drinkCategoryArray[category - 4][subCategory][indexPath.row].price
            cell.containerTitleLabel.text = OfflineClient.sharedInstance.drinkCategoryArray[category - 4][subCategory][indexPath.row].drink.uppercased()
            cell.containerDescrLabel.text = OfflineClient.sharedInstance.drinkCategoryArray[category - 4][subCategory][indexPath.row].descr
            cell.containerPriceLabel.text = OfflineClient.sharedInstance.drinkCategoryArray[category - 4][subCategory][indexPath.row].price
            
            cell.nutsLabel.isHidden = true
            cell.vegLabel.isHidden = true
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! CategoriesViewController
        destination.category = self.category
        
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
