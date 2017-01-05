//
//  ViewController.swift
//  letbo
//
//  Created by 马雪松 on 2016/12/29.
//  Copyright © 2016年 bestn1nja. All rights reserved.
//
import UIKit
import SnapKit
import ReactiveCocoa
import ReactiveSwift
import SwiftyBeaver

class ViewController: UIViewController,UITabBarDelegate {
    
    let FEEDLIST = "feedlist"
    let HOTLIST = "hotlist"
    let HOME = "home"
    let titleLabel = UILabel()
    let navigationBar = UINavigationBar()
    var context = UIViewController()
    
    
    //将日志输出到swiftBeaver中
    let log = SwiftyBeaver.self
    let file = FileDestination()
    let console = ConsoleDestination()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBar()
        view.backgroundColor = UIColor.white
        tabbar.delegate = self
        
//        log.addDestination(file)
        log.addDestination(console)
        
        ///navigationbar的布局
        view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top)
            make.height.equalTo(80)
        }
        titleLabel.text = FEEDLIST
        titleLabel.textAlignment = .center
        navigationBar.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(navigationBar.snp.centerX)
            make.centerY.equalTo(navigationBar.snp.centerY).offset(10)
            make.height.equalTo(60)
            make.width.equalTo(navigationBar.snp.width).multipliedBy(0.3)
        }
        
        //关于tabbar的布局
        view.addSubview(tabbar)
        tabbar.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
            make.height.equalTo(50)
        }
        
        let tabItem1 = UITabBarItem()
        tabItem1.title = FEEDLIST
        tabItem1.tag = 0
        let tabItem2 = UITabBarItem()
        tabItem2.tag = 1
        tabItem2.title = HOTLIST
        let tabItem3 = UITabBarItem()
        tabItem3.title = HOME
        tabItem3.tag = 3
        let tabItems = [tabItem1,tabItem2,tabItem3]
        tabbar.items = tabItems;
        tabbar.selectedItem = tabItem1
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func signalTest() -> Void {
        NSLog("点击")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerProduct(vcType: String) -> UIViewController {
        var res = UIViewController()
        switch vcType {
        case FEEDLIST:
            res = feedViewController()
            break
        case HOTLIST:
            res = hotViewController()
            break
        case HOME:
            res = homeViewController()
            break
        default:
            log.error("contextVC not found")
        }
        
        return res
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        titleLabel.text = item.title
        context = viewControllerProduct(vcType: item.title!)
        let contextRect  = CGRect(x: 0, y: navigationBar.frame.height, width: view.frame.width, height: view.frame.height-navigationBar.frame.height-tabBar.frame.height)
        
        log.verbose(item.title! + "was be select")
        
        replaceViewController(nextVC: context, showFrame: contextRect, complate:{ (res) in
            guard res == true else {
                log.error(NSStringFromClass(context.classForCoder) + "not show")
                return
            }
            log.info(NSStringFromClass(context.classForCoder) + "have show"+"\n")
            return
        })
    }
    
    
    
    /// 切换填充视图的方法
    ///
    /// - Parameters:
    ///   - nextVC: 要展示的视图
    ///   - showFrame: 要展示视图在当前视图占据的区域
    ///   - complate: 完成后回调的closure
    func replaceViewController(nextVC: UIViewController?, showFrame: CGRect, complate: (Bool)->Void) -> Void {
        
        guard nextVC != nil else {
            complate(false)
            return
        }
        context.view.frame = showFrame
        view.addSubview(context.view)
        self.addChildViewController(context)
        
        complate(true)
    }
}

