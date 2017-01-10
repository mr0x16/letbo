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

class feedViewController: UIViewController {//,UITableViewDelegate,UITableViewDataSource {
    
    let feedList = UITableView()
    let console = ConsoleDestination()
    let log = SwiftyBeaver.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(feedList)
        feedList.snp.makeConstraints { (make) in
            make.edges.equalTo(view.snp.edges)
        }
        
        log.addDestination(console)
        let param = ["access_token":myKeychain.getKeychain(key: "access_Token")! as String]
        let httpThread = DispatchQueue.global(qos: .default)
        weiboGetRequest.mrRequest(api: .feedList, parameter: param).responseJSON(queue: httpThread ,completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.log.info(json["statuses"].count)
                self.log.info(json)
                break
            case .failure(let error):
                self.log.error(error)
            }
            //                self.log.info(JSON(data: response.data!).rawString())
            //                self.log.info(JSON(data: response.data!)["error"])
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
