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
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
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
        
        print(category)
        print(categoryArray[category])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray[category].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCollectionCell", for: indexPath)
        return cell
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
