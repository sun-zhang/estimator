//
//  KernelInfoViewController.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/4.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Foundation
import Cocoa

class KernelInfoViewController: NSViewController {
    
    var kernelData : [TableViewUtil.InformationItem?]  = []
    
    //定义字符串数组，并初始化
    var properties = ["kern.ostype","kern.osrelease","kern.osrevision","kern.osversion","kern.version","kern.hostname",
                      "kern.uuid","kern.osproductversion","kern.sleeptime","kern.waketime"]
    
    @IBOutlet weak var kernelInfoTableView: NSTableView!
    
    override func viewDidLoad() {
        
        let kernelInfoResultString = CommandLineUtil.runCommandOfSysctl(arguments: ["-a"])
        kernelData = CommandLineResultReader.ParseKernelInfo(kernelInfoString : kernelInfoResultString)
        
        kernelInfoTableView.delegate = self
        kernelInfoTableView.dataSource = self
    }
}



//view controller实现NSTableViewDataSource协议语法
extension KernelInfoViewController: NSTableViewDataSource {
    
    func numberOfRows(in hardwareInfoTableview: NSTableView) -> Int {
        return kernelData.count
    }
    
}

//再实现一个NSTableViewDelegate协议
extension KernelInfoViewController: NSTableViewDelegate{
    
    //定义了一个列标示的枚举，值是在storyboard中配置的属性值
    fileprivate enum CellIdentifiers {
        static let detailID = "DetailID"
        static let itemID = "ItemID"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var text: String = ""
        var cellIdentifier: String = ""
        
        // 1、判断对象是否为空，是则返回nil给cell
        guard let item = kernelData[row] else {
            return nil
        }
        
        // 2、给tableview的列赋值
        if tableColumn == tableView.tableColumns[0] {
            text = KernelUtil.getItemShowName(itemName: item.itemName)
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
