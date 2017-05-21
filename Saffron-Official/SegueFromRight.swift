//
//  SegueFromLeft.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 13/05/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit

class SegueFromRight: UIStoryboardSegue {
    
    override func perform() {
        let src = self.source
        let dst = self.destination
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.65, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }) { (finished : Bool) in
            src.present(dst, animated: false, completion: nil)
        }
    }
    
}
