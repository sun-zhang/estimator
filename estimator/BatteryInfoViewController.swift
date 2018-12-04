//
//  BatteryInfoViewController.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/2.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Cocoa
import Foundation

class BatteryInfoViewController : NSViewController{
 

    
    @IBOutlet weak var batteryInfoTableView: NSScrollView!
   
    
}



//view controller实现NSTableViewDataSource协议语法
extension ViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return properties.count
    }
    
}

//再实现一个NSTableViewDelegate协议
extension ViewController: NSTableViewDelegate{
    
    
}

