//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Windy on 16/10/3.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }

    func layoutUI(){
    
        let tableView = UITableView(frame: view.bounds, style: .grouped);
        tableView.dataSource = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId")
        
        cell?.textLabel?.text = "\(indexPath.row)"
        return cell!
    }


}

