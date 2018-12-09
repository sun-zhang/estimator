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
    
    func getMaxCapacity() -> Int {
        return 0
    }
    
    func getCurrentCapacity() -> Int {
        return 0
    }
    
    func getPowerSourceState() -> String {
        return ""
    }
    
    func isCharging() -> Bool {
        return false
    }
    
    func isCharged() -> Bool {
        return false
    }
    
    func isPresent() -> Bool {
        return false
    }
    
    func getHardwareSerialNumber() -> String {
        return ""
    }
    
    func getDesignCycleCount() -> Int {
        return 0
    }
    
    func getCurrentCycleCount() -> Int {
        return 0
    }
    
    func getBatteryHealth() -> String {
        return ""
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
