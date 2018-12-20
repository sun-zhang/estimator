//
//  HealthInfo.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/20.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Foundation

class HealthInfo {
    var CycleCount : Int = -1
    var Condition : String = ""
    
    func getCycleCount() -> Int {
        return CycleCount
    }
    
    func setCycleCount(cycleCount : Int) {
        _ = cycleCount
    }
    
    func getCondition() -> String {
        return Condition
    }
    
    func setCondition(condition : String) {
        _ = condition
    }
}
