//
//  OfflineClient.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 05/06/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import Foundation

class OfflineClient: NSObject {
    
    static let sharedInstance = OfflineClient()
    

    var foodCategoryArray: [[[Food]]]!
    var drinkCategoryArray: [[[Drink]]]!
    
    func initArrays() {
        var subFoodArr = Array(repeating: [Food](), count: 11)
        foodCategoryArray = Array(repeating: subFoodArr, count: 4)
        var subDrinkArr = Array(repeating: [Drink](), count: 11)
        drinkCategoryArray = Array(repeating: subDrinkArr, count: 4)
    }
    
    func addToFoodArray(newElement: NSDictionary, indexOne: Int, indexTwo: Int) {
        let name = newElement.value(forKey: "food") as! String
        let descr = newElement.value(forKey: "description") as! String
        let price = newElement.value(forKey: "price") as! String
        if let nuts = newElement.value(forKey: "nuts") as? String {
            if nuts == "y" {
                foodCategoryArray[indexOne][indexTwo].append(Food(food: name, description: descr, price: price, nuts: true))
            } else {
                foodCategoryArray[indexOne][indexTwo].append(Food(food: name, description: descr, price: price, nuts: false))
            }
        } else {
            foodCategoryArray[indexOne][indexTwo].append(Food(food: name, description: descr, price: price, nuts: false))
        }
    }
    
    func addToDrinkArray(newElement: NSDictionary, indexOne: Int, indexTwo: Int) {
        let name = newElement.value(forKey: "Drink") as! String
        let descr = newElement.value(forKey: "Description") as! String
        let price = newElement.value(forKey: "Price") as! String
        drinkCategoryArray[indexOne][indexTwo].append(Drink(drink: name, description: descr, price: price))
    }
    
    func parseIndian() {
        if let path = Bundle.main.path(forResource: "indian", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                    var counter = 0
                    while counter != 134 {
                        if counter <= 7 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 0, indexTwo: 0)
                            counter = counter + 1
                        } else if counter <= 20 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 0, indexTwo: 1)
                            counter = counter + 1
                        } else if counter <= 34 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 0, indexTwo: 2)
                            counter = counter + 1
                        } else if counter <= 45 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 0, indexTwo: 3)
                            counter = counter + 1
                        } else if counter <= 64 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 0, indexTwo: 4)
                            counter = counter + 1
                        } else if counter <= 93 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 0, indexTwo: 5)
                            counter = counter + 1
                        } else if counter <= 103 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 0, indexTwo: 6)
                            counter = counter + 1
                        } else if counter <= 108 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 0, indexTwo: 7)
                            counter = counter + 1
                        } else if counter <= 117 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 0, indexTwo: 8)
                            counter = counter + 1
                            counter = counter + 1
                        } else if counter <= 125 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 0, indexTwo: 9)
                            counter = counter + 1
                        } else if counter <= 133 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 0, indexTwo: 10)
                            counter = counter + 1
                        }
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            } catch let errorTwo {
                print(errorTwo.localizedDescription)
            }
        }
    }
    
    func parseChinese() {
        if let path = Bundle.main.path(forResource: "chinese", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                    var counter = 0
                    while counter != 15 {
                        let newElement = json[counter] as! NSDictionary
                        addToFoodArray(newElement: newElement, indexOne: 1, indexTwo: 0)
                        counter = counter + 1
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
                
            } catch let errorTwo {
                print(errorTwo.localizedDescription)
            }
        }
    }
    
    func parseFusion() {
        if let path = Bundle.main.path(forResource: "fusion", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                    var counter = 0
                    while counter != 9 {
                        if counter <= 5 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 2, indexTwo: 0)
                            counter = counter + 1
                        } else if counter <= 8 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 2, indexTwo: 1)
                            counter = counter + 1
                        }
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
                
            } catch let errorTwo {
                print(errorTwo.localizedDescription)
            }
        }
    }
    
    func parseDesserts() {
        if let path = Bundle.main.path(forResource: "desserts", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                    var counter = 0
                    while counter != 10 {
                        if counter <= 2 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 3, indexTwo: 0)
                            counter = counter + 1
                        } else if counter <= 9 {
                            let newElement = json[counter] as! NSDictionary
                            addToFoodArray(newElement: newElement, indexOne: 3, indexTwo: 1)
                            counter = counter + 1
                        }
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
                
            } catch let errorTwo {
                print(errorTwo.localizedDescription)
            }
        }
    }
    
    func parseBeverages() {
        if let path = Bundle.main.path(forResource: "beverages", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                    var counter = 0
                    while counter != 9 {
                        if counter <= 4 {
                            let newElement = json[counter] as! NSDictionary
                            addToDrinkArray(newElement: newElement, indexOne: 0, indexTwo: 0)
                            counter = counter + 1
                        } else if counter <= 8 {
                            let newElement = json[counter] as! NSDictionary
                            addToDrinkArray(newElement: newElement, indexOne: 0, indexTwo: 1)
                            counter = counter + 1
                        }
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
                
            } catch let errorTwo {
                print(errorTwo.localizedDescription)
            }
        }
    }
    

}
