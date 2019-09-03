//
//  AppDelegate.swift
//  reflexMechanism
//
//  Created by zcds2 on 16/10/10.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

//反射机制创建类
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    /**
       1.swift 中有命名空间
         - 同一命名空间下，全局共享！
         - 第三方框架 使用 swift 如果直接拖拽到项目中，同属一个命名空间，很有可能会冲突
       2.- swift 中 NSClassFromString(反射机制）的写法
         - 反射最重要的目的就是为了解耦！
         - 搜索 ‘反射机制和工厂方法’
         - 封装的很好，而且弹性很大！
    */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //*** 代码中的 ？ 都是可选解包，发送消息，不参与计算
        //所有的？ 都是 Xcode 自动添加的！
        
        //1.实例化 window
        window = UIWindow()
        window?.backgroundColor = UIColor.red
        
        //2.设置跟控制器,需要添加命名空间 -> 默认就是 项目名称（最好不要有数数字和特殊符号）
        let className = "reflexMechanism.ViewController"
        
        //AnyClass? -> 视图控制器类型
        let cls = NSClassFromString(className) as? UIViewController.Type
        //使用类创建视图控制器
        //UIViewController?
        
        let vc = cls?.init()
        
        
        
        // let vc = ViewController()
        window?.rootViewController = vc
        
        //让 windower 可见
        window?.makeKeyAndVisible()

        return true
    }

   

}

