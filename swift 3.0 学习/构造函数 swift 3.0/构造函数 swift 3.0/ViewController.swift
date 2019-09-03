//
//  ViewController.swift
//  构造函数 swift 3.0
//
//  Created by Windy on 16/10/4.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit
/**
 在swift 中,默认同一个项目中(同一命名空间下),所有的类都是共享的,可以直接访问,不需要 import
 所有对象的属性 var, 也可以直接访问到
 **/

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Swift 中对应一个函数 init()构造函数
        //作用:给成员变量分配空间,初始化成员变量
       // let person = Person()
        //print(person.name)
        
        let student = Student()
        print(student.name + "---------" + student.no)
    }

   


}

