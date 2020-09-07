//
//  ProvisionUtils.swift
//  CrowdMarket
//
//  Created by Keith Black on 11/29/16.
//  Copyright © 2016 CrowdMarket. All rights reserved.
//

import Foundation
import TCMobileProvision


func isAPNSandbox() -> Bool {
    
//    return false

    print("Looking for APNS environement...")
    if let mobileProvisionURL = Bundle.main.url(forResource: "embedded", withExtension: "mobileprovision") {
//        dLog("mobileProvisionURL = \(mobileProvisionURL)")
        
        if let mobileProvisionData = try? Data(contentsOf: mobileProvisionURL) {
//            dLog("mobileProvisionData != nil")
            
            if let mobileProvision = TCMobileProvision(data: mobileProvisionData) {
//                dLog("mobileProvision != nil")
                
                if let entitlements = mobileProvision.dict["Entitlements"] as? [String:Any] {
//                    dLog("Entitlements Found")
                    if let apsEnvironment = entitlements["aps-environment"] as? String {
//                        dLog("aps-environment = \(apsEnvironment)")
                        if apsEnvironment == "development" {
                            return true
                        }
                    }
                }
            }
        }
    }
    // The above code accurately identifies sandbox or produciton running on a physical device.
    // However, on the simulator we don't detect a mobileprovision file.
    // Therefore, we will call isSimulator to let us know we are running in the sandbox.
    if Platform.isSimulator {
        return true
    }
    return false
}

struct Platform {
    static let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
        isSim = true
        #endif
        return isSim
    }()
}
