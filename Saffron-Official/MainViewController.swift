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
    let gestureRec = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gestureRec.addTarget(self, action: #selector(animate))
        indian.addGestureRecognizer(gestureRec)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func animate() {
        UIView.animate(withDuration: 0.3) {
            self.indian.center.x -= (2 * self.indian.center.x) + 200
            self.indian.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            //self.performSegue(withIdentifier: "seg2", sender: nil)
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


