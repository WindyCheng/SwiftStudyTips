//
//  ViewController.swift
//  006 swift 设置模型数据
//
//  Created by zcds2 on 16/10/10.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let p = Person()
        p.name = "老王"
        
        let label = DemoLabel(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        view.addSubview(label)
        
        //将模型设置给label
        label.person = p
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

