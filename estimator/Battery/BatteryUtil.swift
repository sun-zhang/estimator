//
//  BatteryUtil.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/9.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//
import Cocoa

//这里不应该直接返回String值，应该返回的是x实现Battery协议（接口）的对象更为合理
class BatteryUtil {
    
    enum BATTERY_INFO_LEVEL {
        case brief
        case normal
        case detailed
    }
    
    struct Constant {
        static let showItem : Set<String> = ["Battery Information",
                                      "Serial Number",
                                      "Manufacturer",
                                      "Device Name",
                                      "Pack Lot Code",
                                      "PCB Lot Code",
                                      "Firmware Version",
                                      "Hardware Revision",
                                      "Cell Revision",
                                      "Charge Remaining (mAh)",
                                      "Fully Charged",
                                      "Charging",
                                      "Full Charge Capacity (mAh)",
                                      "Cycle Count",
                                      "Condition",
                                      "Battery Installed",
                                      "Amperage (mA)",
                                      "Voltage (mV)"]
        static let showName : Dictionary = [
            "Battery Information":"电池信息",
            "Serial Number":"序列号",
            "Manufacturer":"制造商",
            "Device Name":"设备名称",
            "Pack Lot Code":"分组批次号",
            "PCB Lot Code":"PCB批次号",
            "Firmware Version":"固件版本",
            "Hardware Revision":"硬件校正",
            "Cell Revision":"电池校正",
            "Charge Remaining (mAh)":"剩余电量",
            "Fully Charged":"已充满",
            "Charging":"正在充电",
            "Full Charge Capacity (mAh)":"充满最大容量",
            "Cycle Count":"循环次数",
            "Condition":"状态",
            "Battery Installed":"电池已安装",
            "Amperage (mA)":"电流强度",
            "Voltage (mV)":"电压"]
    }
    
    
    
    //获取电池使用状态（使用OC的类实现）
    static func getBatteryStatus() -> String {
        let timeRemaining: CFTimeInterval = IOPSGetTimeRemainingEstimate()
        if timeRemaining == -2.0 {
            return "Plugged"
        } else if timeRemaining == -1.0 {
            return "Recently unplugged"
        } else {
            let minutes = timeRemaining / 60
            return "Time remaining: \(minutes) minutes"
        }
    }
    
    //获取电池基本信息（使用OC的类实现）
    static func getBatteryBasicInfo() -> String {
        let blob = IOPSCopyPowerSourcesInfo()
        let list = IOPSCopyPowerSourcesList(blob?.takeRetainedValue())
        let desc = IOPSGetPowerSourceDescription(blob as CFTypeRef,list as CFTypeRef)
        print(desc?.takeRetainedValue() ?? "default")
        print(desc?.takeUnretainedValue() ?? "default")
        return ""
    }
    
//  获取电池信息
    static func getBatteryInfo() -> BatteryInfo {
        return getBatteryInfo(level: BATTERY_INFO_LEVEL.brief)
    }
    
//  获取电池信息
//  参数：level - 等级（brief,normal,detailed）
    static func getBatteryInfo( level : BATTERY_INFO_LEVEL ) -> BatteryInfo {
        if level == BATTERY_INFO_LEVEL.brief {
            
        }else if level == BATTERY_INFO_LEVEL.normal{
            
        }else if level == BATTERY_INFO_LEVEL.detailed{
            
        }else{
            
            return BatteryInfo()
        }
        return BatteryInfo()
    }
    
    //获取电源列表信息（使用OC的类实现）
    static func getPowerSourcesListInfo() -> String {
        let blob = IOPSCopyPowerSourcesInfo()
        let list = IOPSCopyPowerSourcesList(blob?.takeRetainedValue())
        return list?.takeRetainedValue() as! String
    }
    
/// 根据关键属性获取属性显示名称（显示语言的转换）
    static func getItemShowName(itemName : String) -> String{
        return Constant.showName[itemName] ?? itemName
    }
}
