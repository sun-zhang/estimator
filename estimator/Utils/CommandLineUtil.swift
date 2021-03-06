//
//  CommandLineUtil.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/15.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Foundation

class CommandLineUtil {
    
    /// 执行命令行
    /// - parameter launchPath: 命令行启动路径
    /// - parameter arguments: 命令行参数
    /// - returns: 命令行执行结果
    static func runCommand(launchPath: String, arguments: [String]) -> String {
        let pipe = Pipe()
        let file = pipe.fileHandleForReading
        
        let task = Process()
        task.launchPath = launchPath
        task.arguments = arguments
        task.standardOutput = pipe
        task.launch()
        
        let data = file.readDataToEndOfFile()
        LogUtil.OKPrint(String(data: data, encoding: String.Encoding.utf8)!)
        return String(data: data, encoding: String.Encoding.utf8)!
    }
    
    ///通过执行SystemProfiler命令获取系统信息
    static func runCommandOfSystemProfiler(arguments: [SystemProfilerEnums.arguments]) -> String {
        return runCommand(launchPath: "/usr/sbin/system_profiler", arguments: SystemProfilerEnums.enumsToStringArray(arguments: arguments))
    }
    
    ///通过执行Sysctl命令获取系统信息
    static func runCommandOfSysctl(arguments : [String]) -> String {
        return runCommand(launchPath: "/usr/sbin/sysctl", arguments: arguments)
    }
    
}
