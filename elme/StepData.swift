//
//  AddStepData.swift
//  elme
//
//  Created by Sai Perchard on 10/31/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import Foundation

class StepData {
    class var sharedInstance: StepData {
        struct Static {
            static var instance: StepData?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = StepData()
        }
        
        return Static.instance!
    }
    
    var steps = []
    var stepIndex : Int!
}
