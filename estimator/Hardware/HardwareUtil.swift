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
        
        static let hardwareItemShowName : Dictionary<String,String> = [
            "vm.swapusage":"缓存页使用大小",
            "hw.ncpu":"CPU数量",
            "hw.activecpu":"CPU激活数量",
            "hw.physicalcpu":"物理CPU数量",
            "hw.logicalcpu":"逻辑CPU数量",
            "hw.cputype":"CPU类型",
            "hw.cpusubtype":"CPU子类型",
            "hw.memsize":"内存大小",
            "hw.cpufamily":"CPU系列",
            "hw.cpufrequency":"CPU频率",
            "hw.cpufrequency_min":"CPU最小频率",
            "hw.cpufrequency_max":"CPU最大频率",
            "hw.l1icachesize":"一级缓存大小",
            "hw.l2cachesize":"二级缓存大小",
            "hw.l3cachesize":"三级缓存大小"
        ]
    }
    
    /// 根据关键属性获取属性显示名称（显示语言的转换）
    static func getItemShowName(itemName : String) -> String{
        return Constant.hardwareItemShowName[itemName] ?? itemName
    }
    
}
