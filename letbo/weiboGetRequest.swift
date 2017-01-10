//
//  weiboGetRequest.swift
//  letbo
//
//  Created by 马雪松 on 2017/1/7.
//  Copyright © 2017年 bestn1nja. All rights reserved.
//

import UIKit
import Alamofire

class weiboGetRequest: NSObject,RequestRetrier,RequestAdapter {
    static let baseURL = "https://api.weibo.com/"
    
    
    public enum weiboApi:String {
        case feedList = "2/statuses/friends_timeline.json"
        case hotList = "2/statuses/public_timeline.json"
        case revokeOAuth2 = "oauth2/revokeoauth2"
    }
    
    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        return SessionManager(configuration: configuration)
    }()
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        NSLog(urlRequest.url!.absoluteString)
        return urlRequest
    }
    
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        
        guard let response = request.response else {
            NSLog("request have not response")
            return
        }
    }
    /// 返回一个请求接口的相应
    ///
    /// - Parameters:
    ///   - api: 请求的api名称
    ///   - parameter: 请求api需要的参数
    /// - Returns: 返回一个Alamofire的请求
    static func mrRequest(api:weiboGetRequest.weiboApi, parameter:Dictionary<String, String>) -> Alamofire.DataRequest {
        let fullURL =  generateFullURL(api: api.rawValue, parameter: parameter)
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
