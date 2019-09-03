//
//  Student.swift
//  构造函数 swift 3.0
//
//  Created by Windy on 16/10/4.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class Student: Person {
    
    var no : String
    
    init(name: String, no: String) {
        self.no = no
        
        //调用父类方法, 给name 初始化
        super.init(name: name)
    }

}
