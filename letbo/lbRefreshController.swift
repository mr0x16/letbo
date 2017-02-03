//
//  lbRefreshController.swift
//  letbo
//
//  Created by bocom on 2017/1/25.
//  Copyright © 2017年 bestn1nja. All rights reserved.
//

import UIKit
import Spring

class lbRefreshController: UIRefreshControl {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    let replaceView = SpringView()
    let contentView = UIView()
    let PI:CGFloat = 3.145926
    
    
    override func draw(_ rect: CGRect) {
        
        // Drawing code
//        self.backgroundColor = UIColor.clear
        contentView.frame = self.frame
    }
    
    override init() {
        super.init()
        self.tintColor = UIColor.clear
        self.subviews[0].removeFromSuperview()
//        contentView.backgroundColor = UIColor.white
        
        let bgColor = UIColor.init(patternImage: UIImage(named: "camera_video_download.png")!)
        replaceView.backgroundColor = bgColor
        
        self.addSubview(replaceView)
        replaceView.snp.makeConstraints { (make) in
            make.width.height.equalTo(24)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        self.reactive.controlEvents(.valueChanged).observe{ (event) in
            self.replaceView.animation = "flipY"
            self.replaceView.curve = "spring"
            self.replaceView.duration = 1.0
            self.replaceView.animateToNext(completion: {
                self.replaceView.transform = CGAffineTransform(rotationAngle: self.PI)
            })
        }
        
//        self.addSubview(contentView)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func beginRefreshing() {
        super.beginRefreshing()
        NSLog("beginRefreshing")
    }
    
    override func endRefreshing() {
        super.endRefreshing()
        NSLog("endRefresh")
    }

}
