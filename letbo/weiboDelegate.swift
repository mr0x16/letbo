//
//  weiboDelegate.swift
//  letbo
//
//  Created by 马雪松 on 2017/1/4.
//  Copyright © 2017年 bestn1nja. All rights reserved.
//

import UIKit
import SwiftyBeaver

class weiboDelegate: NSObject,WeiboSDKDelegate {
    
    let console = ConsoleDestination()
    let log = SwiftyBeaver.self
    var countAuthorize = 1;
    override init() {
//        console.minLevel = .debug
        log.addDestination(console)
        
        super.init()
    }
    
    func didReceiveWeiboRequest(_ request: WBBaseRequest!) {
        
    }
    
    func didReceiveWeiboResponse(_ response: WBBaseResponse!) {
        
        let responseClass = NSStringFromClass(response.classForCoder)
        switch responseClass {
        case "WBAuthorizeResponse" :
            let accessToken = (response as! WBAuthorizeResponse).accessToken as String
            log.verbose(">>>>>>>access_token is : " + accessToken + "<<<<<<<")
            myKeychain.setKeychain(key: "access_Token", object: accessToken)
            break
        default:
            break
        }
        let token = myKeychain.getKeychain(key: "access_Token")! as String
        log.verbose(token)
        
    }
}
