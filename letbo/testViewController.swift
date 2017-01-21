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
import Spring

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
            weiboGetRequest.oauth2Request()
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
            
            
            let httpThread = DispatchQueue.global(qos: .default)

            weiboGetRequest.mrRequest(api:.hotList, parameter: nil).responseJSON(queue: httpThread ,completionHandler: { (response) in
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
            //let param = ["access_token":myKeychain.getKeychain(key: "access_Token")! as String]
            let httpThread = DispatchQueue.global(qos: .default)
            
            weiboGetRequest.mrRequest(api: .revokeOAuth2, parameter: nil).responseJSON(queue: httpThread, completionHandler: { (response) in
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
        
        //一个证实，在长宽都是0的view内，仿佛一个50的button，给长宽，设定边距，view和button都看不见，但是时间可以响应
//        let viewTest = UIView()
//        viewTest.autoresizingMask = UIViewAutoresizing.flexibleWidth
//        self.view.addSubview(viewTest)
//        viewTest.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.view.snp.centerX)
//            make.centerY.equalTo(self.view.snp.centerY)
//        }
//        let btnTest = UIButton(type: .custom)
//        btnTest.setTitle("咋地", for: .normal)
//        viewTest.addSubview(btnTest)
//        btnTest.snp.makeConstraints { (make) in
//            make.width.equalTo(50)
//            make.height.equalTo(50)
//            make.top.equalTo(viewTest.snp.top).offset(10)
//            make.bottom.equalTo(viewTest.snp.bottom).offset(-10)
//            make.left.equalTo(viewTest.snp.left).offset(10)
//            make.right.equalTo(viewTest.snp.right).offset(-10)
//        }
//		btnTest.reactive.controlEvents(.touchUpInside).observe { (event) in
//            NSLog("test button is pressed")
//        }
        //五个球，随机1-3个数做牛顿摆
        let contentView = UIView()
        self.view.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView.superview!.snp.centerX)
            make.centerY.equalTo(contentView.superview!.snp.centerY).offset(200)
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(60)
        }
        contentView.backgroundColor = UIColor.blue
        let layer1 = UIView()
        contentView.addSubview(layer1)
        layer1.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        layer1.setNeedsLayout()
        layer1.backgroundColor = UIColor.white
        layer1.layer.cornerRadius = 10
        if #available(iOS 10.0, *) {
            let timeAnimation = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { (time) in
                
            }
        } else {
            // Fallback on earlier versions
        }

        

        
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
