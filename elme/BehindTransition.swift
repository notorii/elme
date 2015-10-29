//
//  BehindTransition.swift
//  elme
//
//  Created by Sai Perchard on 10/28/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class BehindTransition: BaseTransition {

    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        toViewController.view.layer.zPosition = 0
        fromViewController.view.layer.zPosition = 1
        
        UIView.animateWithDuration(duration, animations: {
   
            fromViewController.view.transform = CGAffineTransformMakeScale(0.8, 0.5)
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.transform = CGAffineTransformMakeScale(0.01, 0.01)
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
}
