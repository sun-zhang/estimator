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
    
    var hardwareData : [TableViewUtil.InformationItem?]  = []
    
    @IBOutlet weak var hardwareInfoTableview: NSTableView!
    
    override func viewDidLoad() {
        
        let hardwareInfoResultString = CommandLineUtil.runCommandOfSysctl(arguments: ["-a"])
        hardwareData = CommandLineResultReader.ParseHardwareInfo(hardwareInfoString: hardwareInfoResultString)
        
        hardwareInfoTableview.delegate = self
        hardwareInfoTableview.dataSource = self
    }
    
}


//view controller实现NSTableViewDataSource协议语法
extension HardwareInfoViewController: NSTableViewDataSource {
    
    func numberOfRows(in hardwareInfoTableview: NSTableView) -> Int {
        return hardwareData.count
    }
    
}

//再实现一个NSTableViewDelegate协议
extension HardwareInfoViewController: NSTableViewDelegate{
    
    //定义了一个列标示的枚举，值是在storyboard中配置的属性值
    fileprivate enum CellIdentifiers {
        static let detailID = "DetailID"
        static let itemID = "ItemID"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var text: String = ""
        var cellIdentifier: String = ""
        
        // 1、判断对象是否为空，是则返回nil给cell
        guard let item = hardwareData[row] else {
            return nil
        }
        
        // 2、给tableview的列赋值
        if tableColumn == tableView.tableColumns[0] {
//            text = BatteryUtil.getItemShowName(itemName: item.itemName)
            text = item.itemName
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
