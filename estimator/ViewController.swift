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
            _ = TableViewUtil.InformationItem(itemName:key,itemValue:platform2(key: key))
            //这里还有问题
            //TableViewUtil.dataset.append(item)
        }
        
//        let kernelPage = self.storyboard?.instantiateController(withIdentifier: "TabViewController") as! NSViewController
        
//        self.presentAsSheet(kernelPage)
//        self.presentAsModalWindow(kernelPage)
//        self.transition(from: self, to: kernelPage, options: NSViewController.TransitionOptions.slideBackward, completionHandler: nil)
        
        //定义tableView的代理和数据源协议实现类都是本身
        //放在这里就是在按钮点击事件触发的时候，给tableview填充数据
//        tableView.delegate = self
//        tableView.dataSource = self
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
    
    func platform2(key:String) -> String{
        if let key = key.cString(using: String.Encoding.utf8) {
            //先取到目标值的字节数
            var size: Int = 0
            sysctlbyname(key, nil, &size, nil, 0)
            //判断是否位数字类型的字节长度
            if size == 4 || size == 8 || size == 16 || size == 32 {
                let keyStr = String(cString: key)
                //特殊情况处理，有一个字符串类型的值正好是8个字节长度的，过滤掉
                if keyStr == properties[7]{
                    return getStringValue(key: key, size: &size)
                }else{
                    //特殊情况，值是时间戳类型，转换成正常的日期格式
                    if keyStr == properties[8] || keyStr == properties[9]{
                        return timestampToDateString(timestamp: getIntegerValue(key: key, size: &size))
                    }else{
                        //剩下的都是数字类型值
                        return String(getIntegerValue(key: key, size: &size))
                    }
                }
            }else{
                return getStringValue(key: key, size: &size)
            }
        }
        return ""
    }
    
    //时间戳转日期格式函数
    func timestampToDateString(timestamp:Int) -> String {
        //转换为时间
        let timeInterval:TimeInterval = TimeInterval(timestamp)
        let date = Date(timeIntervalSince1970: timeInterval)
        
        //格式话输出
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        return dformatter.string(from: date)
    }
    
    func dateToTimestamp(date : Date) -> Int {
        //当前时间的时间戳
        let timeInterval:TimeInterval = date.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return timeStamp
    }
    
    //获取数字值函数
    func getIntegerValue(key:[CChar],size:UnsafeMutablePointer<Int>) -> Int {
        let intValue = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        sysctlbyname(key, intValue, size,nil, 0)
        let value = intValue.pointee
        free(intValue)
        return value
    }
    
    //获取字符串值函数
    func getStringValue(key:[CChar],size:UnsafeMutablePointer<Int>!) -> String {
        var machine = [CChar](repeating: 0, count: size.pointee)
        sysctlbyname(key, &machine, size, nil, 0)
        return String(cString: machine)
    }
    
    
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


