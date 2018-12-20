//
//  BatteryInfoViewController.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/2.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Cocoa

class BatteryInfoViewController : NSViewController{
 
    //定义字符串数组，并初始化
    var batteryProperties = ["BatteryHealth","CurrentCapacity","DesignCycleCount","HardwareSerialNumber","IsCharging","IsPresent","MaxCapacity","PowerSourceID","PowerSourceState","TimeToEmpty","TimeToFullCharge","TransportType","Type"]
    
    @IBOutlet weak var batteryInfoTableView: NSScrollView!
   
//    var blob = IOPSCopyPowerSourcesInfo()

    override func viewDidLoad() {
        
    let args = [SystemProfilerEnums.arguments.Power]
    
    print(CommandLineUtil.runCommandOfSystemProfiler(arguments: args))
       // print(BatteryUtil.getPowerSourcesListInfo())

       // print(BatteryUtil.getBatteryStatus())
        
       // print(BatteryUtil.getBatteryBasicInfo())
    }
}



//view controller实现NSTableViewDataSource协议语法
extension BatteryInfoViewController: NSTableViewDataSource {
    
    func numberOfRows(in batteryInfoTableView: NSTableView) -> Int {
        return batteryProperties.count
    }
    
}

//再实现一个NSTableViewDelegate协议
extension BatteryInfoViewController: NSTableViewDelegate{
    
    
}

