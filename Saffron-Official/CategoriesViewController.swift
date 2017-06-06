//
//  CategoriesViewController.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 22/05/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var category = -1
    var categoryArray = [[String]]()
    var subCategory = -1
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        categoryCollectionView.backgroundColor = UIColor.init(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        categoryCollectionView.indicatorStyle = .white
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        let indian = ["Starters - Snacks", "Starters - Veg", "Starters - Non Veg", "Soups and Shorba", "Indian Bread", "Main - Veg", "Main - Chicken", "Seafood", "Meat", "Biryani", "Rice and Pulao"]
        let chinese = ["Chinese Delights"]
        let fusion = ["Meat", "Side Orders"]
        let dessert = ["Fusion Dessert", "Indian Dessert"]
        let beverages = ["Cold", "Milkshakes"]
        let wine = [String]() //NEED TO CHANGE THE JSON FILE FOR THE WINE
        
        
        categoryArray.append(indian)
        categoryArray.append(chinese)
        categoryArray.append(fusion)
        categoryArray.append(dessert)
        categoryArray.append(beverages)
        categoryArray.append(wine)
        
//        print(category)
//        print(categoryArray[category])
        
        self.categoryCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        let leftInset = (categoryCollectionView.frame.width - layout.itemSize.width) / 2
        layout.sectionInset = UIEdgeInsets(top: 15, left: leftInset, bottom: 15, right: leftInset)
        categoryCollectionView.collectionViewLayout = layout
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray[category].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCollectionCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.layer.cornerRadius = 15
        //cell.layer.borderColor = UIColor.white.cgColor
        //cell.layer.borderWidth = 1
        
        let actualCategory = categoryArray[category]
        cell.cellLabel.text = actualCategory[indexPath.row]
        cell.cellLabel.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        return cell
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDish" {
            let destination = segue.destination as! OrderViewController
            destination.category = self.category
            let senderCell = sender as! CategoryCollectionViewCell
            subCategory = (self.categoryCollectionView.indexPath(for: senderCell)?.row)!
            destination.subCategory = subCategory
        }
    }

}
