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
        <#code#>
    }
    
    func getCurrentCapacity() -> Int {
        <#code#>
    }
    
    func getPowerSourceState() -> String {
        <#code#>
    }
    
    func isCharging() -> Bool {
        <#code#>
    }
    
    func isCharged() -> Bool {
        <#code#>
    }
    
    func isPresent() -> Bool {
        <#code#>
    }
    
    func getHardwareSerialNumber() -> String {
        <#code#>
    }
    
    func getDesignCycleCount() -> Int {
        <#code#>
    }
    
    func getCurrentCycleCount() -> Int {
        <#code#>
    }
    
    func getBatteryHealth() -> String {
        <#code#>
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
