//
//  myKeychain.swift
//  letbo
//
//  Created by 马雪松 on 2017/1/5.
//  Copyright © 2017年 bestn1nja. All rights reserved.
//

import UIKit
import KeychainAccess
import SwiftyBeaver

class myKeychain: NSObject {
    static let keychain = Keychain(service: "com.mr0x16.letbo")
    
    static func setKeychain(key:String, object:String) -> Void {
        keychain[key] = object
    }
    
    static func getKeychain(key:String) -> String? {
        let console = ConsoleDestination()
        let log = SwiftyBeaver.self
        log.addDestination(console)
        
        do {
            let res = try keychain.getString(key)! as String
            log.verbose("\(key) has getted success!")
            return res
        } catch is Error {
            log.error("\(key) has not getted success!")
            return nil
        }
    }
}
