//
//  ViewController.swift
//  计算型属性 (getter & setter)
//
//  Created by Windy on 16/10/6.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p = Person()
        
        p.name = "老王"
        
        print(p.name)
        
        //第一种写法:不允许修改
      //  p.title = "vgfjbjbnnb"
        
        print(p.title)
        
        
        //第二种写法:不允许修改
        //  p.title2 = "啦啦啦啦啦啦啦啦啦啦了"
        
        
        print(p.title2)
        
    }




}

