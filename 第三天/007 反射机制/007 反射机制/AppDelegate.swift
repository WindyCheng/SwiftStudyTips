//
//  AppDelegate.swift
//  007 反射机制
//
//  Created by zcds2 on 16/10/10.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //** 注意window 是可选的
    var window: UIWindow?
    



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //*** 代码中的 ？ 都是可选解包，发送消息，不参与计算
        //所有的？ 都是 Xcode 自动添加的！
        
        //1.实例化 window
        window = UIWindow()
        window?.backgroundColor = UIColor.red
        
        //2.设置跟控制器,需要添加命名空间 -> 默认就是 项目名称（最好不要有数数字和特殊符号）
        let className = "007 反射机制.ViewController"
        
        //AnyClass? -> 视图控制器类型
        let cls = NSClassFromString(className) as? UIViewController.Type
        //使用类创建视图控制器
        //UIViewController?
        
        let vc = cls?.init()
        
        
        
//        let vc = ViewController()
        window?.rootViewController = vc
        
        //让 windower 可见
        window?.makeKeyAndVisible()
        
        return true
    }

   

}

