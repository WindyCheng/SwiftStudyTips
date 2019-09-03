//
//  UIButton+extension.swift
//  swift 3.0 加法计算器
//
//  Created by Windy on 16/10/5.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

extension UIButton{
    
    convenience init( title: String, color: UIColor = UIColor.darkGray) {
        
        self.init()
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.sizeToFit()
    }
    
    
    
    
}
