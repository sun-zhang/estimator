//
//  SystemProfilerEnums.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/20.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Foundation

class SystemProfilerEnums {
    
    enum arguments : String, EnumeratableEnumType {
        
        static var allValues: [SystemProfilerEnums.arguments]{
            return [ParallelATA,UniversalAccess,SecureElement,Applications,Audio,Bluetooth,Camera,CardReader,Component,iBridge,DeveloperTools,Diagnostics,DisabledSoftware,DiscBurning,Ethernet,Extensions,FibreChannel,FireWire,Firewall,Fonts,Frameworks,Displays,Hardware,HardwareRAID,InstallHistory,LegacySoftware,NetworkLocation,Logs,ManagedClient,Memory,NVMe,Network,PCI,ParallelSCSI,Power,PrefPane,PrintersSoftware,Printers,ConfigurationProfile,RawCamera,SAS,SerialATA,SPI,SmartCards,Software,StartupItem,Storage,SyncServices,Thunderbolt,USB,NetworkVolume,WWAN,AirPort]
        }
        
        case    ParallelATA = "SPParallelATADataType"
        case    UniversalAccess = "SPUniversalAccessDataType"
        case    SecureElement = "SPSecureElementDataType"
        case    Applications = "SPApplicationsDataType"
        case    Audio = "SPAudioDataType"
        case    Bluetooth = "SPBluetoothDataType"
        case    Camera = "SPCameraDataType"
        case    CardReader = "SPCardReaderDataType"
        case    Component = "SPComponentDataType"
        case    iBridge = "SPiBridgeDataType"
        case    DeveloperTools = "SPDeveloperToolsDataType"
        case    Diagnostics = "SPDiagnosticsDataType"
        case    DisabledSoftware = "SPDisabledSoftwareDataType"
        case    DiscBurning = "SPDiscBurningDataType"
        case    Ethernet = "SPEthernetDataType"
        case    Extensions = "SPExtensionsDataType"
        case    FibreChannel = "SPFibreChannelDataType"
        case    FireWire = "SPFireWireDataType"
        case    Firewall = "SPFirewallDataType"
        case    Fonts = "SPFontsDataType"
        case    Frameworks = "SPFrameworksDataType"
        case    Displays = "SPDisplaysDataType"
        case    Hardware = "SPHardwareDataType"
        case    HardwareRAID = "SPHardwareRAIDDataType"
        case    InstallHistory = "SPInstallHistoryDataType"
        case    LegacySoftware = "SPLegacySoftwareDataType"
        case    NetworkLocation = "SPNetworkLocationDataType"
        case    Logs = "SPLogsDataType"
        case    ManagedClient = "SPManagedClientDataType"
        case    Memory = "SPMemoryDataType"
        case    NVMe = "SPNVMeDataType"
        case    Network = "SPNetworkDataType"
        case    PCI = "SPPCIDataType"
        case    ParallelSCSI = "SPParallelSCSIDataType"
        case    Power = "SPPowerDataType"
        case    PrefPane = "SPPrefPaneDataType"
        case    PrintersSoftware = "SPPrintersSoftwareDataType"
        case    Printers = "SPPrintersDataType"
        case    ConfigurationProfile = "SPConfigurationProfileDataType"
        case    RawCamera = "SPRawCameraDataType"
        case    SAS = "SPSASDataType"
        case    SerialATA = "SPSerialATADataType"
        case    SPI = "SPSPIDataType"
        case    SmartCards = "SPSmartCardsDataType"
        case    Software = "SPSoftwareDataType"
        case    StartupItem = "SPStartupItemDataType"
        case    Storage = "SPStorageDataType"
        case    SyncServices = "SPSyncServicesDataType"
        case    Thunderbolt = "SPThunderboltDataType"
        case    USB = "SPUSBDataType"
        case    NetworkVolume = "SPNetworkVolumeDataType"
        case    WWAN = "SPWWANDataType"
        case    AirPort = "SPAirPortDataType"
    }
    
    static func toString() -> String{
        var str : String = ""
        for argument in SystemProfilerEnums.arguments.allValues{
            str.append(argument.rawValue)
            str.append(",")
        }
        return str
    }
    
    static func enumsToStringArray(arguments:[SystemProfilerEnums.arguments]) -> [String]{
        var strArray = [String](repeating: "", count: arguments.count)
        for (index,item) in arguments.enumerated(){
            strArray[index] = item.rawValue
        }
        return strArray
    }
}
