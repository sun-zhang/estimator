//
//  BatteryInfo.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/1.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Foundation
import IOKit.ps

class BatteryInfo : Battery {
    
    var maxCapacity : Int = -1
    var currentCapacity : Int = -1
    var powerSourceState : String = ""
    var charging : Bool = false
    var charged : Bool = false
    var present : Bool = false
    var hardwareSerialNumber : String = ""
    var designCycleCount : Int = -1
    var currentCycleCount : Int = -1
    
    var modelInfo : ModelInfo?
    var chargeInfo : ChargeInfo?
    var healthInfo : HealthInfo?
    
    func getModelInfo() -> ModelInfo? {
        return modelInfo
    }
    
    func setModelInfo(modelInfo : ModelInfo) {
        _ = modelInfo
    }
    
    func getChargeInfo() -> ChargeInfo? {
        return chargeInfo
    }
    
    func setChargeInfo(chargeInfo : ChargeInfo) {
        _  = chargeInfo
    }
    
    func getHealthInfo() -> HealthInfo? {
        return healthInfo
    }
    
    func setHealthInfo(healthInfo : HealthInfo) {
        _ = healthInfo
    }
    
    func getMaxCapacity() -> Int {
        return 0
    }
    
    func setMaxCapacity(maxCapacity : Int) {
        _ = maxCapacity
    }
    
    func getCurrentCapacity() -> Int {
        return 0
    }
    
    func setCurrentCapacity(currentCapacity : Int) {
        _ = currentCapacity
    }
    
    func getPowerSourceState() -> String {
        return ""
    }
    
    func setPowerSourceState(powerSourceState : String) {
        _ = powerSourceState
    }
    
    func isCharging() -> Bool {
        return false
    }
    
    func setIsCharging(charging : Bool) {
        _ = charging
    }
    
    func isCharged() -> Bool {
        return false
    }
    
    func setIsCharged(charged : Bool) {
        _ = charged
    }
    
    func isPresent() -> Bool {
        return false
    }
    
    func setIsPresent(present : Bool) {
        _ = present
    }
    
    func getHardwareSerialNumber() -> String {
        return ""
    }
    
    func setHardwareSerialNumber(hardwareSerialNumber : String) {
        _ = hardwareSerialNumber
    }
    
    func getDesignCycleCount() -> Int {
        return 0
    }
    
    func setDesignCycleCount(designCycleCount : Int) {
        _ = designCycleCount
    }
    
    func getCurrentCycleCount() -> Int {
        return 0
    }
    
    func setCurrentCycleCount(currentCycleCount : Int) {
        _ = currentCycleCount
    }
    
    func getBatteryInfo(){
        // Take a snapshot of all the power source info
        let snapshot = IOPSCopyPowerSourcesInfo().takeRetainedValue()
        
        // Pull out a list of power sources
        let sources = IOPSCopyPowerSourcesList(snapshot).takeRetainedValue() as Array
        
        // For each power source...
        for ps in sources {
            // Fetch the information for a given power source out of our snapshot
            let info = IOPSGetPowerSourceDescription(snapshot, ps).takeUnretainedValue() as! [String: AnyObject]
            
            // Pull out the name and capacity
            if let name = info[kIOPSNameKey] as? String,
                let capacity = info[kIOPSCurrentCapacityKey] as? Int,
                let max = info[kIOPSMaxCapacityKey] as? Int {
                print("\(name): \(capacity) of \(max)")
            }
        }
    }
    
    
}
