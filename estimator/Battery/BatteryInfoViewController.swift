//
//  BatteryInfoViewController.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/2.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Cocoa

class BatteryInfoViewController : NSViewController{
    
    var batteryData : [TableViewUtil.InformationItem?]  = []
 
    let BatteryInformation_KEYWORD : String = "Battery Information"
    let SerialNumber_KEYWORD : String = "Serial Number"
    let Manufacturer_KEYWORD : String = "Manufacturer"
    let DeviceName_KEYWORD : String = "Device Name"
    let PackLotCode_KEYWORD : String = "Pack Lot Code"
    let PCBLotCode_KEYWORD : String = "PCB Lot Code"
    let FirmwareVersion_KEYWORD : String = "Firmware Version"
    let HardwareRevision_KEYWORD : String = "Hardware Revision"
    let CellRevision_KEYWORD : String = "Cell Revision"
    let ChargeRemaining_KEYWORD : String = "Charge Remaining (mAh)"
    let FullyCharged_KEYWORD : String = "Fully Charged"
    let Charging_KEYWORD : String = "Charging"
    let FullChargeCapacity_KEYWORD : String = "Full Charge Capacity (mAh)"
    let CycleCount_KEYWORD : String = "Cycle Count"
    let Condition_KEYWORD : String = "Condition"
    let BatteryInstalled_KEYWORD : String = "Battery Installed"
    let Amperage_KEYWORD : String = "Amperage (mA)"
    let Voltage_KEYWORD : String = "Voltage (mV)"
    
    //定义字符串数组，并初始化
    var batteryProperties = ["BatteryHealth","CurrentCapacity","DesignCycleCount","HardwareSerialNumber","IsCharging","IsPresent","MaxCapacity","PowerSourceID","PowerSourceState","TimeToEmpty","TimeToFullCharge","TransportType","Type"]
    
    
    @IBOutlet weak var batteryInfoTableView: NSTableView!
    
//    var blob = IOPSCopyPowerSourcesInfo()

    override func viewDidLoad() {
        
        let args = [SystemProfilerEnums.arguments.Power]
    
        let powerInfoString = CommandLineUtil.runCommandOfSystemProfiler(arguments: args)
    
        batteryData = CommandLineResultReader.ParseBatteryInfo(batteryInfoString: powerInfoString)
        
        batteryInfoTableView.delegate = self
        batteryInfoTableView.dataSource = self
        
       // print(BatteryUtil.getPowerSourcesListInfo())

       // print(BatteryUtil.getBatteryStatus())
        
       // print(BatteryUtil.getBatteryBasicInfo())
    }
}



//view controller实现NSTableViewDataSource协议语法
extension BatteryInfoViewController: NSTableViewDataSource {
    
    func numberOfRows(in batteryInfoTableView: NSTableView) -> Int {
        return batteryData.count
    }
    
}

//再实现一个NSTableViewDelegate协议
extension BatteryInfoViewController: NSTableViewDelegate{
    
    //定义了一个列标示的枚举，值是在storyboard中配置的属性值
    fileprivate enum CellIdentifiers {
        static let detailID = "DetailID"
        static let itemID = "ItemID"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var text: String = ""
        var cellIdentifier: String = ""
        
        // 1、判断对象是否为空，是则返回nil给cell
        guard let item = batteryData[row] else {
            return nil
        }
        
        // 2、给tableview的列赋值
        if tableColumn == tableView.tableColumns[0] {
            text = BatteryUtil.getItemShowName(itemName: item.itemName)
            cellIdentifier = CellIdentifiers.itemID
        } else if tableColumn == tableView.tableColumns[1] {
            text = item.itemValue
            cellIdentifier = CellIdentifiers.detailID
        }
        
        // 3、创建cellview对象
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            return cell
        }
        return nil
    }
    
}

