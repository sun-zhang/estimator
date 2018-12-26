//
//  HardwareUtil.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/25.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Foundation

class HardwareUtil {
    //定义字符串数组，并初始化
    struct Constant {
        static let hardwareShowItem : Set<String> = ["vm.swapusage",
                                                     "hw.ncpu",
                                                     "hw.activecpu",
                                                     "hw.physicalcpu",
                                                     "hw.logicalcpu",
                                                     "hw.cputype",
                                                     "hw.cpusubtype",
                                                     "hw.memsize",
                                                     "hw.cpufamily",
                                                     "hw.cpufrequency",
                                                     "hw.cpufrequency_min",
                                                     "hw.cpufrequency_max",
                                                     "hw.l1icachesize",
                                                     "hw.l2cachesize",
                                                     "hw.l3cachesize"]
        
    }
    
}
