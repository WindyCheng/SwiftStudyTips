//
//  MyViewController.swift
//  TestAnimation
//
//  Created by Sky Jean on 15/3/24.
//  Copyright (c) 2015年 com.maiziedu. All rights reserved.
//

import UIKit

class MyViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       tabBar.clipsToBounds = true
        
       // var items = tabBar.items as! [UITabBarItem]
        
        let items = self.tabBar.items! as
            [UITabBarItem]
        for item in items {
            item.title = nil
            item.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -6, right: 0)
        }
    }




}
