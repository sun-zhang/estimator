//
//  HardwareInfoVC.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/4.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Foundation
import Cocoa

class HardwareInfoViewController : NSViewController {
    
    //定义字符串数组，并初始化
    var properties = ["vm.swapusage","hw.ncpu","hw.activecpu","hw.physicalcpu", "hw.logicalcpu","hw.cputype","hw.cpusubtype","hw.memsize","hw.cpufamily","hw.cpufrequency","hw.cpufrequency_min","hw.cpufrequency_max",
                      "hw.l1icachesize","hw.l2cachesize","hw.l3cachesize"]
    
    @IBOutlet weak var hardwareTableView:NSScrollView!
}
