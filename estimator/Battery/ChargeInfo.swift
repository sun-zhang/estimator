//
//  ChargeInfo.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/20.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Foundation

class ChargeInfo{
    
    ///还需要充多少mAh
    var ChargeRemaining : Int = -1
    var FullyCharged : String = YesNoEnum.YesNo.No.rawValue
    var Charging : String = YesNoEnum.YesNo.No.rawValue
    var FullChargeCapacity : Int = -1
    
    func getChargeRemaining() -> Int {
        return ChargeRemaining
    }
    
    func setChargeRemaining(ChargeRemaining : Int) {
        _ = ChargeRemaining
    }
    
    func getFullyCharged() -> String {
        return FullyCharged
    }
    
    func setFullyCharged(FullyCharged : String) {
        _ = FullyCharged
    }
    
    func getCharging() -> String {
        return Charging
    }
    
    func setCharging(Charging : String) {
        _ = Charging
    }
    
    func getFullChargeCapacity() -> Int {
        return FullChargeCapacity
    }
    
    func setFullChargeCapacity(FullChargeCapacity : Int) {
        _ = FullChargeCapacity
    }
    
}
