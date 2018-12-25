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
    
    static func BatteryInfoFromResultString(result : String) -> [TableViewUtil.InformationItem?] {
        let batteryInfoString = CommandLineUtil.runCommandOfSystemProfiler(arguments: [SystemProfilerEnums.arguments.Power])
        return ParseBatteryInfo(batteryInfoString : batteryInfoString)
    }
    
static func ParseBatteryInfo(batteryInfoString : String) -> [TableViewUtil.InformationItem?] {
        var lines : [String] = []
        batteryInfoString.enumerateLines{
            line, _ in
            lines.append(line)
        }
//        var batteryInfo = [String : String]()
        var batteryInfoArray : [TableViewUtil.InformationItem?] = []
        for item in lines{
            if item.trimmingCharacters(in: .whitespacesAndNewlines).count > 0{
                let temp = item.components(separatedBy: ":")
                LogUtil.OKPrint(temp[0])
                if temp.count > 1{
//                    batteryInfo.updateValue(temp[1].trimmingCharacters(in: .whitespacesAndNewlines), forKey: temp[0].trimmingCharacters(in: .whitespacesAndNewlines))
                    if isShowItem(itemName:temp[0].trimmingCharacters(in: .whitespacesAndNewlines)) {
                        batteryInfoArray.append(TableViewUtil.InformationItem(itemName:temp[0].trimmingCharacters(in: .whitespacesAndNewlines),itemValue:temp[1].trimmingCharacters(in: .whitespacesAndNewlines)))
                        
                    }
                
//                }else {
//                    batteryInfo.updateValue("", forKey: temp[0].trimmingCharacters(in: .whitespacesAndNewlines))
                }
            }
        }
        return batteryInfoArray
    }
    
    static func isShowItem(itemName : String) -> Bool {
        if !itemName.isEmpty {
            return BatteryUtil.Constant.showItem.contains(itemName)
        }
        return false
    }
    
}
