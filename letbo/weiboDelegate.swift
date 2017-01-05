//
//  weiboDelegate.swift
//  letbo
//
//  Created by 马雪松 on 2017/1/4.
//  Copyright © 2017年 bestn1nja. All rights reserved.
//

import UIKit
import SwiftyBeaver
import KeychainAccess

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
//        guard response.classForCoder == WBAuthorizeResponse.self else {
//            return
//        }
//        let message = "响应状态: \(response.statusCode.rawValue)\nresponse.userId: \((response as! WBAuthorizeResponse).userID)\nresponse.accessToken: \((response as! WBAuthorizeResponse).accessToken)\n响应UserInfo数据: \(response.userInfo)\n原请求UserInfo数据: \(response.requestUserInfo)"
//        
//        
//        
//        let alert = UIAlertView(title: "认证结果", message: message, delegate: nil, cancelButtonTitle: "确定")
//        alert.show()
        
        let responseClass = NSStringFromClass(response.classForCoder)
        switch responseClass {
        case "WBAuthorizeResponse" :
            let accessToken = (response as! WBAuthorizeResponse).accessToken as String
            log.verbose(">>>>>>>access_token is : " + accessToken + "<<<<<<<")
            let keychina = Keychain(service: "com.mr0x16.letbo")
            keychina["access_Token"] = accessToken
            break
        default:
            break
        }
//        do {
//            let token = try Keychain(service: "com.mr0x16.letbo").getString("access_Token")! as String
//            log.info(token)
//        } catch is Error {
//            
//        }
        
    }
}
