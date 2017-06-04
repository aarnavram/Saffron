//
//  DishesViewController.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 04/06/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit
import FoldingCell

class DishesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dishTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dishTableView.backgroundColor = UIColor.init(red: 20/255, green: 20/255, blue: 20/255, alpha: 1)
        let backImage = UIImage(named: "transparentDishBack")
        let backgroundView = UIImageView(image: backImage)
        backgroundView.contentMode = .scaleAspectFit
        dishTableView.backgroundView = backgroundView
        self.view.addSubview(backgroundView)
        NSLayoutConstraint(item: backgroundView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        dishTableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //CHANGE
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell //CHANGE
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
