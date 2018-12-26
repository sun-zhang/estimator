//
//  KernelUtil.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/26.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Foundation

class KernelUtil {
    struct Constant {
        static let kernelShowItem : Set<String> = ["kern.ostype",
                                                   "kern.osrelease",
                                                   "kern.osrevision",
                                                   "kern.osversion",
                                                   "kern.version",
                                                   "kern.hostname",
                                                   "kern.uuid",
                                                   "kern.osproductversion"]
        static let kernelItemShowName : Dictionary<String,String> = ["kern.ostype":"操作系统类型",
                                                                     "kern.osrelease":"操作系统发行版本号",
                                                                     "kern.osrevision":"操作系统校正",
                                                                     "kern.osversion":"操作系统版本",
                                                                     "kern.version":"内核版本号",
                                                                     "kern.hostname":"主机名称",
                                                                     "kern.uuid":"唯一序列号",
                                                                     "kern.osproductversion":"操作系统产品版本"]
        
    }
    
    /// 根据关键属性获取属性显示名称（显示语言的转换）
    static func getItemShowName(itemName : String) -> String{
        return Constant.kernelItemShowName[itemName] ?? itemName
    }
}
