//
//  ModelInfo.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/20.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Foundation

class ModelInfo{
    
    var SerialNumber : String = ""
    var Manufacturer : String = ""
    var DeviceName : String = ""
    var PackLotCode : String = ""
    var PCBLotCode : String = ""
    var FirmwareVersion : Int = -1
    var HardwareRevision : Int = -1
    var CellRevision : Int = -1
    
    func getSerialNumber() -> String {
        return SerialNumber
    }
    
    func setSerialNumber(SerialNumber : String) {
        _ = SerialNumber
    }
    
    func getManufacturer () -> String {
        return Manufacturer
    }
    
    func setManufacturer(Manufacturer : String) {
        _ = Manufacturer
    }
    
    func getDeviceName() -> String {
        return DeviceName
    }
    
    func setDeviceName(DeviceName : String) {
        _ = DeviceName
    }
    
    func getPackLotCode() -> String {
        return PackLotCode
    }
    
    func setPackLotCode(PackLotCode : String) {
        _ = PackLotCode
    }
    
    func getPCBLotCode() -> String {
        return PCBLotCode
    }
    
    func setPCBLotCode(PCBLotCode : String) {
        _ = PCBLotCode
    }
    
    func getFirmwareVersion() -> Int{
        return FirmwareVersion
    }
    
    func setFirmwareVersion(FirmwareVersion : Int){
        _ = FirmwareVersion
    }
    
    func getHardwareRevision() -> Int{
        return HardwareRevision
    }
    
    func setHardwareRevision(HardwareRevision : Int)  {
        _ = HardwareRevision
    }
    
    func getCellRevision() -> Int {
        return CellRevision
    }
    
    func setCellRevision(CellRevision : Int) {
        _ = CellRevision
    }
}
