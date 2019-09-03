//
//  ViewController.swift
//  GCD swift 3.0
//
//  Created by Windy on 16/10/3.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData { (result) in
            print("获取的新闻数据\(result)")
        }
        
    }
    
    /**
     
      在异步执行任务,获取结果,通过闭包/block 回调
      闭包的应用场景和 block 完全 一致
    */
    func loadData(completion: @escaping (_ result:[String]) ->()) -> () {
        //将任务添加到队列,指定执行任务的函数
        //翻译:队列调度任务(block/闭包, 以同步/ 异步 的方式执行
        DispatchQueue.global().async {
            print("耗时操作\(Thread.current)")
            
            //休眠
            Thread.sleep(forTimeInterval: 1.0)
            
            //获得结果
            let json = ["头条", "八卦", "出大事了"]
            DispatchQueue.main.async{
                print("主线程更新UI\(Thread.current)")
                completion(json)
            }
        }
    }


}

