//
//  ViewController.swift
//  构造函数 (KVC) swift 3.0
//
//  Created by Windy on 16/10/4.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       // let p = Person(dict: ["name": "老张" as AnyObject, "age" : 90 as AnyObject, "title": "BOSS" as AnyObject])
        
        //print("\(p.name) \(p.age) \(p.title)")
        
        //print("\(p.name) \(p.age) ") //会崩溃
        
        //*子类
        //如果子类没有重写父类的方法,调用的时候,会直接调用父类的方法!!
        let p = Student(dict: ["name": "老张" as AnyObject, "age" : 90 as AnyObject, "title": "BOSS" as AnyObject, "no" : "001" as AnyObject, "xxx" : "ABC" as AnyObject]) //多出的key
        
        print("\(String(describing: p.name)) \(p.age) \(String(describing: p.title)) \(String(describing: p.no))") //会崩溃
        
    }




}

