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

class testViewController: UIViewController {

    let authorizeButton = UIButton(type: UIButtonType.system)
    let feedlistButton = UIButton(type:UIButtonType.system)
    
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
            self.log.info("authorize is success")
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
        
        
        
//        authorizeButton.reactive.makeBindingTarget(on: SchedulerProtocol, <#T##action: (UIButton, U) -> Void##(UIButton, U) -> Void#>)
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
