//
//  Bundle+Extentions.swift
//  reflexMechanism
//
//  Created by zcds2 on 16/10/10.
//  Copyright © 2016年 Windy. All rights reserved.
//

import Foundation

extension Bundle{
    
//    //返回命名空间字符串
//    func namespace() -> String {
    
        //***解包***
        //1> 因为字典是可选的，因此需要解包再取值
        //   如果字典 为 nil， 就不取值
        //2> 通过key 从字典中取值，如果 key 错了，就没有值了
        //   AnyObject? 表示不一定能够获取到值

//        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
//             return infoDictionary?["CFBundleName"] as? String ?? ""
//    }
    var namespace: String{
         return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
