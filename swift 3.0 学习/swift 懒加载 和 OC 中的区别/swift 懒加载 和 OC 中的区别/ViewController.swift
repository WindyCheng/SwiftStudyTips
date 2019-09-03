//
//  ViewController.swift
//  swift 懒加载 和 OC 中的区别
//
//  Created by Windy on 16/10/6.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //和OC 不同
    //一旦label设置为nil, 懒加载不会再次执行!
    //懒加载的代码只会在第一次调用的时候,执行闭包,然后将必报的结果保存 在 label 的属性中
    private lazy var label: UILabel? = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //会调用懒加载创建label
        print(label ?? "")
        
        label?.text = "hello"
        label?.sizeToFit()
        
        print(label ?? "")
        
        
        //释放label
        label = nil
        
        
        //和OC 不同
        //一旦label设置为nil, 懒加载不会再次执行!
        print(label ?? "")
        
        view.addSubview(label!)
        label?.center = view.center
    }
    
    override func didReceiveMemoryWarning() {
        
        //swift 中一定注意不要主动清理视图或控间
        //因为懒加载不会再次创建!!!!
    }

}

