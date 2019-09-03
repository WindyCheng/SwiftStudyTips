//
//  Student.swift
//  构造函数 swift 3.0
//
//  Created by Windy on 16/10/4.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class Student: Person {
    
    var no :String //必选属性
    
    override init() {
        print("student init")
        no = "001"
        super.init()
    }

}
