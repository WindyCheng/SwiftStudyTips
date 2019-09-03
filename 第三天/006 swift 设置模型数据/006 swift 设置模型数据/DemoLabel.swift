//
//  DemoLabel.swift
//  006 swift 设置模型数据
//
//  Created by zcds2 on 16/10/10.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class DemoLabel: UILabel {

    //模型 ->给视图设置模型，由视图自己根据模型的数据，决定显示内容
    var person: Person?{
        
        //替代 OC 中重写 setter 方法
        didSet{
            
            // 此时 name 属性已有值，可以直接使用设置 UI
            text = person?.name
        }
    }

}
