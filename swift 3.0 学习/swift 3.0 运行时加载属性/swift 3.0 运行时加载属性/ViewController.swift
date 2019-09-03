//
//  ViewController.swift
//  swift 3.0 运行时加载属性
//
//  Created by Windy on 16/10/5.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        print("**********************************")
        print(Person.propertyList())
        print("**********************************")
    }

 


}

