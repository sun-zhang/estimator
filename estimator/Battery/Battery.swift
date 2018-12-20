//
//  Battery.swift
//  该类定义了一个电池的实现类应该能够渠道这么多的电池信息
//  estimator
//
//  Created by Sam Zhang on 2018/12/1.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Foundation

public protocol Battery {
    
    //获取电池最大容量
    func getMaxCapacity()->Int
    
    //获取当前电池容量
    func getCurrentCapacity() -> Int
    
    //获取电池状态
    func getPowerSourceState() -> String
    
    //是否正在充电
    func isCharging() -> Bool
    
    //是否已经充满
    func isCharged() -> Bool
    
    //是否存在电池
    func isPresent() -> Bool
    
    //获取电池硬件序列号
    func getHardwareSerialNumber() -> String
    
    //获取设计最大循环次数
    func getDesignCycleCount() -> Int
    
    //获取当前循环次数
    func getCurrentCycleCount() -> Int
    
}
