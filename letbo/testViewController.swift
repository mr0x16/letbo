//
//  testViewController.swift
//  letbo
//
//  Created by 马雪松 on 2017/1/2.
//  Copyright © 2017年 bestn1nja. All rights reserved.
//

import UIKit
import SnapKit
import ReactiveSwift
import SwiftyBeaver
import Alamofire
import SwiftyJSON

class testViewController: UIViewController {

    let authorizeButton = UIButton(type: UIButtonType.system)
    let feedlistButton = UIButton(type:UIButtonType.system)
    let revokeAuthorizeButton = UIButton(type: UIButtonType.system)
    
    let viewFrame = UIScreen.main.bounds
    let console = ConsoleDestination()
    let log = SwiftyBeaver.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        log.addDestination(console)
        
        
        authorizeButton.setTitle("登陆", for: .normal)
        view.addSubview(authorizeButton)
        authorizeButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(20)
            make.left.equalTo(view.snp.left)
            make.width.equalTo(viewFrame.width/3)
            make.height.equalTo(viewFrame.height/10)
        }
        authorizeButton.reactive.controlEvents(.touchUpInside).observe { (event) in
            self.log.info("authorize is start")
            let request = WBAuthorizeRequest.request() as?  WBAuthorizeRequest
            request?.redirectURI = "https://api.weibo.com/oauth2/default.html"
            request?.scope = "all"
            request?.userInfo = ["SSO_From": "testViewController",
                "Other_Info_1": NSNumber.init(value: 123),
                "Other_Info_2": ["obj1", "obj2"],
                "Other_Info_3": ["key1": "obj1", "key2": "obj2"]];
            WeiboSDK.send(request)
        }
        
        feedlistButton.setTitle("内容列表", for: .normal)
        view.addSubview(feedlistButton)
        feedlistButton.snp.makeConstraints { (make) in
            make.left.equalTo(authorizeButton.snp.right)
            make.top.equalTo(authorizeButton.snp.top)
            make.bottom.equalTo(authorizeButton.snp.bottom)
            make.width.equalTo(authorizeButton.snp.width)
        }
        feedlistButton.reactive.controlEvents(.touchUpInside).observe { (event) in
            self.log.info("feedlist is start")
            
            let param = ["access_token":myKeychain.getKeychain(key: "access_Token")! as String]
            let httpThread = DispatchQueue.global(qos: .default)

            weiboGetRequest.mrRequest(api:.feedList, parameter: param).responseJSON(queue: httpThread ,completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    self.log.info(json["statuses"].count)
                    self.log.info(json)
                    break
                case .failure(let error):
                    self.log.error(error)
                }
            })
        }
        
        revokeAuthorizeButton.setTitle("删除认证", for: .normal)
        view.addSubview(revokeAuthorizeButton)
        revokeAuthorizeButton.snp.makeConstraints { (make) in
            make.left.equalTo(feedlistButton.snp.right)
            make.top.equalTo(feedlistButton.snp.top)
            make.width.equalTo(feedlistButton.snp.width)
            make.bottom.equalTo(feedlistButton.snp.bottom)
        }
        revokeAuthorizeButton.reactive.controlEvents(.touchUpInside).observe { (event) in
            self.log.info("revoke is start")
            let param = ["access_token":myKeychain.getKeychain(key: "access_Token")! as String]
            let httpThread = DispatchQueue.global(qos: .default)
            
            weiboGetRequest.mrRequest(api: .revokeOAuth2, parameter: param).responseJSON(queue: httpThread, completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    self.log.info(json)
                    
                    break
                case .failure(let error):
                    self.log.error(error)
                }
            })
            
        }
        
        let sessionManager = SessionManager.default
        sessionManager.adapter = weiboGetRequest()
        sessionManager.retrier = weiboGetRequest()
//        sessionManager.session.invalidateAndCancel()
        let url = URL(string: "https://api.weibo.com/2/statuses/friends_timeline.json?access_token=2.00iFEYmB0vfOjV2f0815a25caA7z2&source=468847591")
        
        var urlRequest = URLRequest(url:url!)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        sessionManager.request(urlRequest).validate().responseJSON { (response) in
            self.log.verbose(response)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
