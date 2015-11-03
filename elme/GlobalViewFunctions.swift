//
//  GlobalViewFunctions.swift
//  elme
//
//  Created by Sai Perchard on 10/29/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

extension UIViewController {
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
