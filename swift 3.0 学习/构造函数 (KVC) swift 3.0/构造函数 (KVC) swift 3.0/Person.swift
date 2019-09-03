//
//  Person.swift
//  构造函数 (KVC) swift 3.0
//
//  Created by Windy on 16/10/4.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

/**
 1.定义模型属性的时候,如果是对象, 通常都是可选的
 ---在需要的时候创建
 ---避免写构造函数,可以简化代码
 2.如果是基本数据类型,不能设置成可选的,而且要设置初始值,否侧KVC 会崩溃!
 3.如果需要使用 KVC 设置数值,属性不能是 private的,否则会崩溃!!!!
 4.使用KVC 方法之前,应该调用super.init(),保证对象实例化完成!
 **/
class Person: NSObject {
    
    //name 属性是可选的,在OC 中很多的属性都是在需要的时候创建的
    //因为在iPhone 开发中,内存很宝贵,有些属性并不一定需要分配内存空间
    //延迟加载,在需要的时候在加载
    var name: String?
    
    //给基本数据类型属性初始化
    //使用KVC 会提示无法找到 age的 key
    //-原因: Int 是一个基本数据类型的结构体,OC 中没有,OC中只有基本数据类型!
    // swift使用 KVC 是时  不能 使用 var age: Int? 可选
    //var age: Int?
    
    var age: Int = 0 //给基本数据类型设置了初始值!!!!!!
   
    //如果是私有属性, 使用KVC设置值的时候,同样无法设置, 会崩溃!!!!!
  //  private var title: String?
    
    var title: String?
    
    
    //重载构造函数,使用字典为本类设置初始值
    init(dict: [String:AnyObject]) {
        
        //保证对象已经完全初始化
        super.init()  //可选属性可以先调父类
        
        //使用self 的方法 'setValuesForKeys' 之前应该先调用 super.init()
        //KVC 是OC 的方法 ***运行时给对象发送消息***
        //先决条件是: 要求对象已经实例化完成!
        setValuesForKeys(dict)
    }
    
    //重写父类的方法
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        //没有调用父类的方法,将父类的代码完全覆盖!不会崩溃(用于解决字典keys 多于 属性数
    }

}
