//
//  CommandLineResultReader.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/16.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

class CommandLineResultReader {
    
//  从结果字符串中获取对象属性值，并填充到对象中(以后再写)
//    static func BuildObjectByResultString<T>(result : String, object : T.Type) -> T {
//        let t = T.
//        return T
//    }
    
    static func BuildObjectByResultString<T>(result : String, object : T){
        
    }
    
    static func BatteryInfoFromResultString(result : String) -> BatteryInfo {
        let batteryInfo = BatteryInfo()
        var batteryInfoString = CommandLineUtil.runCommandOfSystemProfiler(arguments: [SystemProfilerEnums.arguments.Power])
        
        batteryInfo.setIsCharged(charged: false)
        return batteryInfo
    }
    
}
