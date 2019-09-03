//
//  Person.swift
//  构造函数 swift 3.0
//
//  Created by Windy on 16/10/4.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

/***
 1.给自己的属性分配空间并且设置初始化
 2.调用父类的的 '构造函数',并给父类的属性分配空间设置初始值
 (根OC 的顺序相反, 由子及父)
 ***/

class Person: NSObject {
    
    
    var name:String //必选属性
    
    //重写 ->父类有这个方法,子类重新实现, 需要 override 关键字
    //
    override init() {
        
        print("Person init")
        name = "小明"
        
        super.init()
    }

}
