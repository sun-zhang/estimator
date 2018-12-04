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
    
    //定义字符串数组，并初始化
    var properties = ["kern.ostype","kern.osrelease","kern.osrevision","kern.osversion","kern.version","kern.hostname",
                      "kern.uuid","kern.osproductversion","kern.sleeptime","kern.waketime"]
    
    @IBOutlet weak var kernelInfoTableView: NSScrollView!
}
