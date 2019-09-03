//
//  ViewController.swift
//  懒加载 swif 3.0
//
//  Created by Windy on 16/10/6.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //初始化label,并且分配空间,会提前创建控件
    //移动端开发, 延迟加载, 减少内存消耗
    //懒加载--lazy
    /***
        1.能够延迟创建
        2.最大的好处-->解除解包的烦恼
    ***/
    lazy var label: DemoLabel = DemoLabel() //懒加载简单实现
   // 懒加载本质上是一个闭包
   //懒加载完整写法: 供参考,开发中少用原因: 1.闭包中的智能提示不好.
   //                                 2.闭包中如果出现self.还需要注意循环引用.
    /**
       {} 包装代码
       () 执行代码
    */
/***    lazy var label = {() ->DemoLabel in
        let l = DemoLabel()
        //设置label 的属性
        return l
    }()
***/
    

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
   private func layoutUI()  {
    //!--- 强制解包参与计算,确保有值,为了参与 addSubview 计算加入数组记录控件,数组不允许插入 nil
    //强行解包一般先 用guard let 判空
    //?----可选解包, 调用方法,如果为nil,不调用方法,但是不参与计算
    
    view.addSubview(label)
    label.text = "hello"
    label.sizeToFit()
    label.center = view.center
    
    }
}

