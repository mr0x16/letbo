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

class feedViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    let feedList = UITableView()
    let console = ConsoleDestination()
    let log = SwiftyBeaver.self
    var json:JSON = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(feedList)
        feedList.snp.makeConstraints { (make) in
            make.edges.equalTo(view.snp.edges)
        }
        
        feedList.delegate = self
        feedList.dataSource = self
        
        log.addDestination(console)
        
        self.dataUpdate()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataUpdate() -> Void {
        let httpThread = DispatchQueue.global(qos: .default)
        weiboGetRequest.mrRequest(api: .feedList, parameter: nil).responseJSON(queue: httpThread ,completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                self.json = JSON(value)["statuses"]
                self.log.info(self.json.count)
//                self.log.info(self.json)
                self.feedList.reloadData()
                break
            case .failure(let error):
                self.log.error(error)
            }
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        let title = (self.json.array?[indexPath.row])!["user"]["description"]
        let text = (self.json.array?[indexPath.row])!["text"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.json.count
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
