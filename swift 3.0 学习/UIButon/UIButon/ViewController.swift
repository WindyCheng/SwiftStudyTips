//
//  ViewController.swift
//  UIButon
//
//  Created by Windy on 16/10/3.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton()
        
        btn.setTitle("come on", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal);
        btn.sizeToFit()
        btn.center = view.center;
        view.addSubview(btn);
        // Do any additional setup after loading the view, typically from a nib.
    }




}

