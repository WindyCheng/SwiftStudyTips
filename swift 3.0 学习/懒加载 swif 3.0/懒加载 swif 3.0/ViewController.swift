//
//  ViewController.swift
//  懒加载 swif 3.0
//
//  Created by Windy on 16/10/6.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label: DemoLabel?  //定义:表示变量可以为nil,或者有一个值

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutUI()
    }
    
   private func layoutUI()  {
    
    label = DemoLabel()
    
    //!--- 强制解包参与计算,确保有值,为了参与 addSubview 计算加入数组记录控件,数组不允许插入 nil
    //强行解包一般先 用guard let 判空
    //?----可选解包, 调用方法,如果为nil,不调用方法,但是不参与计算
    
    /***类型装换
       as? ---前面结果是可选的, if let / guard let 一定用 as?
       as! ---前面的结果一定有值
       as  ---NSSting --> String, NSArray --> [], NSDictionary-->[]
       因为底层做了结构体和OC 对象的桥接
     何时需要类型装换?
     将父类装换为子类,因为子类的方法和属性比父类多,转换风险.
    ***/
 
    view.addSubview(label!)
    label?.text = "hello"
    label?.sizeToFit()
    label?.center = view.center
    
    }
}

