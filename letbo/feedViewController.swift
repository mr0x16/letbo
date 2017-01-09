//
//  feedViewController.swift
//  letbo
//
//  Created by 马雪松 on 2016/12/31.
//  Copyright © 2016年 bestn1nja. All rights reserved.
//

import UIKit


class feedViewController: UIViewController {//,UITableViewDelegate,UITableViewDataSource {
    
    let feedList = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(feedList)
        feedList.snp.makeConstraints { (make) in
            make.edges.equalTo(view.snp.edges)
        }
        
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
