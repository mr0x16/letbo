//
//  weiboGetRequest.swift
//  letbo
//
//  Created by 马雪松 on 2017/1/7.
//  Copyright © 2017年 bestn1nja. All rights reserved.
//

import UIKit
import Alamofire
import ReactiveCocoa
import ReactiveSwift
import SwiftyBeaver

class weiboGetRequest: NSObject,RequestRetrier,RequestAdapter,WeiboSDKDelegate {
    static let baseURL = "https://api.weibo.com/"
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static private let sessionManager = SessionManager.default
    
    public enum weiboApi:String {
        case feedList = "2/statuses/friends_timeline.json"
        case hotList = "2/statuses/public_timeline.json"
        case revokeOAuth2 = "oauth2/revokeoauth2"
    }
    
    let console = ConsoleDestination()
    let log = SwiftyBeaver.self
    var countAuthorize = 1;
    
    static var reLoginStaute = Bool()
    
    static var observer = Observer<Bool, NSError>()
    
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
            guard let accessToken = (response as! WBAuthorizeResponse).accessToken, accessToken != nil else {
                NSLog("access_Token is nil")
                break
            }
            log.verbose(">>>>>>>access_token is : " + accessToken + "<<<<<<<")
            myKeychain.setKeychain(key: "access_Token", object: accessToken as String)
            if weiboGetRequest.reLoginStaute {
                weiboGetRequest.observer.send(value: true)
            }
            break
        default:
            break
        }
        
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        guard myKeychain.getKeychain(key: "access_Token") != nil else {
            return urlRequest
        }
        let access_Token = myKeychain.getKeychain(key: "access_Token")! as String
        urlRequest.url = URL(string: "\(urlRequest.url!.absoluteString)&access_token=\(access_Token)")
        NSLog(urlRequest.url!.absoluteString)
        return urlRequest
    }
    
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        
        guard let response = request.response else {
            NSLog("request have not response")
            completion(false, 0.0)
            return
        }
        
        if response.statusCode == 403 {
            weiboGetRequest.reLoginStaute = true
            let (signal, signalObserver) = Signal<Bool, NSError>.pipe()
            weiboGetRequest.observer = signalObserver
            signal.observe({ (event) in
                let isLogin = event.value!
                if isLogin {
                    weiboGetRequest.reLoginStaute = false
                    completion(true, 1.0)
                } else {
                    self.log.info("value is \(isLogin)")
                }
            })
            weiboGetRequest.oauth2Request()
        } else {
            completion(false, 0.0)
            NSLog("request is failure")
        }
    }
    /// 返回一个请求接口的相应
    ///
    /// - Parameters:
    ///   - api: 请求的api名称
    ///   - parameter: 请求api需要的参数
    /// - Returns: 返回一个Alamofire的请求
    static func mrRequest(api:weiboGetRequest.weiboApi, parameter:Dictionary<String, String>?) -> Alamofire.DataRequest {
        sessionManager.adapter = weiboGetRequest()
        sessionManager.retrier = weiboGetRequest()
        
        let fullURL =  generateFullURL(api: api.rawValue, parameter: parameter)
        return sessionManager.request(fullURL).validate()
    }
    
    static func oauth2Request() -> Void {
        let request = WBAuthorizeRequest.request() as?  WBAuthorizeRequest
        request?.redirectURI = "https://api.weibo.com/oauth2/default.html"
        request?.scope = "all"
        request?.userInfo = ["SSO_From": "testViewController",
                             "Other_Info_1": NSNumber.init(value: 123),
                             "Other_Info_2": ["obj1", "obj2"],
                             "Other_Info_3": ["key1": "obj1", "key2": "obj2"]];
        WeiboSDK.send(request)
    }
    
    /// 使用api名称和参数生成请求的完整url
    ///
    /// - Parameters:
    ///   - api: 请求的api名称
    ///   - parameter: 请求api所需要的参数
    /// - Returns: 返回一个完整的请求url
    private static func generateFullURL(api:String, parameter:Dictionary<String, String>?) -> String {
        var fullURL = "\(baseURL)\(api)?source=\(AppDelegate.weiboAppKey)"
        guard parameter != nil else {
            return fullURL
        }
        let param = parameter!.map { (key,value) -> String in
            var element = ""
            element = "&\(key)=\(value)"
            return element
            }
        
        for element in param {
            fullURL = "\(fullURL)\(element)"
        }
//        NSLog(fullURL)
        return fullURL
    }
}
