//
//  feedViewController.swift
//  letbo
//
//  Created by 马雪松 on 2016/12/31.
//  Copyright © 2016年 bestn1nja. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyBeaver

class feedViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    let feedList = UITableView()
    let console = ConsoleDestination()
    let log = SwiftyBeaver.self
    var json = [JSON]()
    var since_id:String = "0"
    var  max_id:String = "0"
    let updateCount:String = "20"
    let refreshView = UIRefreshControl()
    
    
    var updateStaute:Bool = false {
        didSet{
//            var totalNum = 0
            dataUpdate(insertFlag: updateStaute)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(feedList)
        
        feedList.snp.makeConstraints { (make) in
            make.edges.equalTo(view.snp.edges)
        }
        
        feedList.separatorStyle = .singleLineEtched
        feedList.delegate = self
        feedList.dataSource = self
        feedList.estimatedRowHeight = 100
        feedList.rowHeight = UITableViewAutomaticDimension
        feedList.addSubview(refreshView)
        let replaceFrame = refreshView.bounds
        let replaceView = UIView()
        replaceView.backgroundColor = UIColor.red
        refreshView.backgroundColor = UIColor.clear
        refreshView.tintColor = UIColor.clear
        refreshView.subviews[0].removeFromSuperview()
        refreshView.addSubview(replaceView)
        replaceView.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.centerX.equalTo(refreshView.snp.centerX)
            make.centerY.equalTo(refreshView.snp.centerY)
        }
        log.addDestination(console)
        
        self.dataUpdate(insertFlag: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataUpdate(insertFlag:Bool) -> Void {
        let httpThread = DispatchQueue.global(qos: .default)
        var param = Dictionary<String,String>()
        if insertFlag {
            param = ["since_id":since_id,"count":updateCount]
        } else {
            param = ["max_id":max_id,"count":updateCount]
        }

        weiboGetRequest.mrRequest(api: .feedList, parameter: param).responseJSON(queue: httpThread ,completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                let responseArray = JSON(value)["statuses"].array!
                if responseArray.count != 0{
                    if insertFlag {
                        self.since_id = responseArray[0]["id"].rawString()!
                        if self.max_id == "0" {
                            self.max_id = (responseArray[responseArray.count-1]["id"].rawValue as! Int64 - 1).description
                        }
                        self.json = responseArray + self.json
                    } else {
                        self.max_id = (responseArray[responseArray.count-1]["id"].rawValue as! Int64 - 1).description
                        self.json += responseArray
                    }
                    self.log.info(self.json.count)
                    
                    weak var weakSelf = self
                    DispatchQueue.main.async {
                        weakSelf?.feedList.reloadData()
                    }
                }
                break
            case .failure(let error):
                self.log.error(error)
            }
            
            if self.refreshView.isRefreshing {
                DispatchQueue.main.async(execute: {
                    self.refreshView.endRefreshing()
                })
            }
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "normalCell")
//        let title = (self.json.array?[indexPath.row])!["user"]["screen_name"]
        let text = self.json[indexPath.row]["text"].rawString()!
        if indexPath.row%2 == 0 {
            cell.backgroundColor = UIColor(red: 242/256, green: 242/256, blue: 242/256, alpha: 1)
        }
        
        cell.textLabel?.text = text
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.sizeToFit()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.json.count
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        NSLog("view have in edge")
        NSLog("\(scrollView.contentOffset.y)")
        let offSet = scrollView.contentOffset.y
        if offSet <= 0 {
            self.updateStaute = true
//            self.refreshView.beginRefreshing()
        }
        
        if offSet == scrollView.contentSize.height - scrollView.frame.size.height {
            self.updateStaute = false
        }
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
