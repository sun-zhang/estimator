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
    
    //定义了一个字典对象，但是似乎没有什么用
    var dictionary: Dictionary<String, Any>?
    
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
            print(key, platform(key: key))
        }
        
       
    }
    
    //定义函数platform，来依次获取系统中的值，并返回结果
    func platform(key:String) -> String {
        var size = 0
        //使用sysctlbyname方法获取系统,目前还是OC的用法，swift没有提供
        sysctlbyname(key, nil, &size, nil, 0)
        var machine_value = [CChar](repeating: 0,  count: size)
        sysctlbyname(key, &machine_value, &size, nil, 0)
        
        //注意：按照此方法无法返回数字类型的值
        return String(cString: machine_value)
    }
    
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //定义tableView的代理和数据源协议实现类都是本身
        tableView.delegate = self
        tableView.dataSource = self
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
    
    fileprivate enum CellIdentifiers {
        static let detailID = "detailID"
        static let itemID = "itemID"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var text: String = ""
        var cellIdentifier: String = ""
        
        // 1
        //TODO: 这里需要对dictionary的数据集进行改写，不能使用dictionary，因为无法使用row属性
        guard let item = dictionary else {
            return nil
        }
        
        // 2
        if tableColumn == tableView.tableColumns[0] {
            //这里缺少对text的赋值，下一个if逻辑同理
            //text = item.key
            cellIdentifier = CellIdentifiers.itemID
        } else if tableColumn == tableView.tableColumns[1] {
            //text = item.value
            cellIdentifier = CellIdentifiers.detailID
        }
        
        // 3
        if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            return cell
        }
        return nil
    }
}
