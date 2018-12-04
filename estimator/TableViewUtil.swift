//
//  TableViewUtil.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/4.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Cocoa

class TableViewUtil {
    
    //定义一个字定对象的数组，用于数据的存储，默认值为空
    var dataset : [InformationItem?] = []
    
    //定义一个自定义结构体当作自定义对象，用于存储
    struct InformationItem {
        var itemName :String
        var itemValue : String
    }
    
    //定义了一个列标示的枚举，值是在storyboard中配置的属性值
    fileprivate enum CellIdentifiers {
        static let detailID = "DetailID"
        static let itemID = "ItemID"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var text: String = ""
        var cellIdentifier: String = ""
        
        // 1、判断对象是否为空，是则返回nil给cell
        guard let item = dataset[row] else {
            return nil
        }
        
        // 2、给tableview的列赋值
        if tableColumn == tableView.tableColumns[0] {
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


