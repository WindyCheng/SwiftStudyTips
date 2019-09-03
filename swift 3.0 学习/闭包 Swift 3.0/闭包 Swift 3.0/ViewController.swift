//
//  ViewController.swift
//  闭包 Swift 3.0
//
//  Created by Windy on 16/10/3.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit



/**
   闭包
   1.提前准备好的代码
   2.在需要的时候执行
   3.可以当坐参数传递
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        demo()
        
        //1.最简单的闭包
        //() -> ()没参数,没返回值的函数
        //如果没有参数,没有返回值,可以省略,连in都可以省略
        //option + click 参看类型(常量,变量,函数,闭包....)
        let b1 = {
            print("hello")
        }
        //执行闭包
        b1()
        
        //2.带参数的闭包
        //在闭包中,参数,返回值,实现代码写在{}中
        //需要使用一个关键字'in' 分隔定义与实现
        //{形参列表 -> 返回值类型 in  // 实现代码}
        let b2 = { (x:Int) -> () in
            print(x)
        }
        //执行闭包
        b2(1999999999)
        
        
        
        //3.带参数/返回值的闭包
        //在闭包中,参数,返回值,实现代码写在{}中
        //需要使用一个关键字'in' 分隔定义与实现
        //{形参列表 -> 返回值类型 in  // 实现代码}
        let b3 = { (x:Int) -> Int in
           return x + 250
        }
        //执行闭包
        print(b3(750))
    }
    
    func demo() {
        print(sum(x: 1, y: 2))
        //1.定义一个常量记录函数
        let f = sum
        //2.在需要的时候执行
        print(f(10, 30))
        
    }
    
    func sum(x: Int, y:Int) -> Int {
        return x + y
    }



}

