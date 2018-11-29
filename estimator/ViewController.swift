//
//  ViewController.swift
//  estimator
//
//  Created by Sam Zhang on 2018/11/25.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController{
    
    //定义字符串数组，并初始化
    var properties = ["kern.ostype","kern.osrelease","kern.osrevision","kern.osversion","kern.version","kern.hostname",
        "kern.uuid","kern.osproductversion","kern.sleeptime","kern.waketime","vm.swapusage","hw.ncpu","hw.activecpu","hw.physicalcpu",
        "hw.logicalcpu","hw.cputype","hw.cpusubtype","hw.memsize","hw.cpufamily","hw.cpufrequency","hw.cpufrequency_min","hw.cpufrequency_max",
        "hw.l1icachesize","hw.l2cachesize","hw.l3cachesize","machdep.cpu.vendor","machdep.cpu.brand_string","machdep.cpu.family","machdep.cpu.model",
        "machdep.cpu.core_count","machdep.cpu.thread_count"]
    
    //定义一个字定对象的数组，用于数据的存储，默认值为空
    var dataset : [InformationItem?] = []
    
    @IBAction func click(_ sender: Any) {
        /* 暂时屏蔽
        //print的语法
        print("这里是点击事件触发")
        //这里是使用ProcessInfo获取系统相关的信息
        print("activeProcessorCount:",ProcessInfo.processInfo.activeProcessorCount)
        //for循环的画语法
        for (key,value) in ProcessInfo.processInfo.environment{
            print(key,value)
        }
        print("fullUserName:",ProcessInfo.processInfo.fullUserName)
        print("globallyUniqueString:",ProcessInfo.processInfo.globallyUniqueString)
        print("hostName:",ProcessInfo.processInfo.hostName)
        print("operatingSystemVersion:",ProcessInfo.processInfo.operatingSystemVersion)
        print("operatingSystemVersionString:",ProcessInfo.processInfo.operatingSystemVersionString)
        print("physicalMemory:",ProcessInfo.processInfo.physicalMemory)
        print("processIdentifier:",ProcessInfo.processInfo.processIdentifier)
        print("processName:",ProcessInfo.processInfo.processName)
        print("processorCount:",ProcessInfo.processInfo.processorCount)
        print("systemUptime:",ProcessInfo.processInfo.systemUptime)
        print("thermalState:",ProcessInfo.processInfo.thermalState)
        print("userName:",ProcessInfo.processInfo.userName)
        //默认值的语法
        print("accessibilityFocusedUIElement:",ProcessInfo.processInfo.accessibilityFocusedUIElement ?? "nil")
        print("accessibilityNotifiesWhenDestroyed:",ProcessInfo.processInfo.accessibilityNotifiesWhenDestroyed)
        print("attributeKeys:",ProcessInfo.processInfo.attributeKeys)
        print("autoContentAccessingProxy:",ProcessInfo.processInfo.autoContentAccessingProxy)
        */
        
        
        //循环获取数组中值，并赋值到key变量中
        for key in properties {
            //打印到控制台
            //print(key, platform(key: key))
            //赋值
            let item = InformationItem(itemName:key,itemValue:platform(key: key))
            //print(item.itemName,item.itemValue)
            dataset.append(item)
        }
        
        //定义tableView的代理和数据源协议实现类都是本身
        //放在这里就是在按钮点击事件触发的时候，给tableview填充数据
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //定义函数platform，来依次获取系统中的值，并返回结果
    func platform(key:String) -> String {
        var size = 0
        //使用sysctlbyname方法获取系统,目前还是OC的用法，swift没有提供
        //这个方法还是有点问题，无法正常获取数字类型的值
        sysctlbyname(key, nil, &size, nil, 0)
        var machine_value = [CChar](repeating: 0,  count: size)
        sysctlbyname(key, &machine_value, &size, nil, 0)
        
        //注意：按照此方法无法返回数字类型的值
        return String(cString: machine_value)
    }
    
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

//view controller实现NSTableViewDataSource协议语法
extension ViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return properties.count
    }
    
}

//再实现一个NSTableViewDelegate协议
extension ViewController: NSTableViewDelegate{
    
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

//定义一个自定义结构体当作自定义对象，用于存储
struct InformationItem {
    var itemName :String
    var itemValue : String
}
