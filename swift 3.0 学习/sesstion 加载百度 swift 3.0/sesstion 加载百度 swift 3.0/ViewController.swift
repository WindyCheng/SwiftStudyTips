//
//  ViewController.swift
//  sesstion 加载百度 swift 3.0
//
//  Created by Windy on 16/10/5.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let p = Person(name: "老王", age: 30)
        print(p?.name ?? "")
        
        
       //URL的构造函数可以返回 nil
        //构造函数就是实例化对象的
        //init?(sting: Stirng) ->构造函数可以返回nil
        let url = URL(string: "http://www.baidu.com")
        
        //发起网络请求
        //-和OC 的区别,闭包的所有参数,需要自己写,OC 是直接带入
        //-如果不关心的值,可以直接 '_'忽略
        
        URLSession.shared.dataTask(with: url!) { (data, _, error) in
            
            guard let data = data else {
                print("网络请求失败 \(String(describing: error))")
                return
            }
            
            //将data 转换为String
            let html = String(data: data, encoding:.utf8)
            print(html ?? "")
        }.resume()
    }

 

}

