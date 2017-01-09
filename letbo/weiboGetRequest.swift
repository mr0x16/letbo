//
//  weiboGetRequest.swift
//  letbo
//
//  Created by 马雪松 on 2017/1/7.
//  Copyright © 2017年 bestn1nja. All rights reserved.
//

import UIKit
import Alamofire

class weiboGetRequest: NSObject {
    static let baseURL = "https://api.weibo.com/2/"
    
    
    /// 返回一个请求接口的相应
    ///
    /// - Parameters:
    ///   - api: 请求的api名称
    ///   - parameter: 请求api需要的参数
    /// - Returns: 返回一个Alamofire的请求
    static func mrRequest(api:String, parameter:Dictionary<String, String>) -> Alamofire.DataRequest {
        let fullURL =  generateFullURL(api: api, parameter: parameter)
        return Alamofire.request(fullURL)
    }
    
    
    /// 使用api名称和参数生成请求的完整url
    ///
    /// - Parameters:
    ///   - api: 请求的api名称
    ///   - parameter: 请求api所需要的参数
    /// - Returns: 返回一个完整的请求url
    private static func generateFullURL(api:String, parameter:Dictionary<String, String>) -> String {
        var fullURL = ""
        
        let param = parameter.map { (key,value) -> String in
            var element = ""
            element = "\(key)=\(value)"
            return element
            }
        
        for element in param {
            fullURL = "\(baseURL)\(api)?\(element)"
        }
        fullURL = "\(fullURL)&source=\(AppDelegate.weiboAppKey)"
        NSLog(fullURL)
        return fullURL
    }
}
