//
//  ViewController.swift
//  swift 3.0 加法计算器
//
//  Created by Windy on 16/10/4.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numText1:UITextField?
    var numText2:UITextField?
    var resultLabel:UILabel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutUI()
    }
    
    func layoutUI() -> () {
        
       // let tf1 = UITextField(frame: CGRect(x: 20, y: 20, width: 100, height: 30))
      //  tf1.borderStyle = .roundedRect
      //  tf1.text = "0"
        
        let tf1 =  UITextField(frame: CGRect(x: 20, y: 100, width: 100, height: 30), placeholder: "0")
        view.addSubview(tf1)
        numText1 = tf1
        
        //let tf2 = UITextField(frame: CGRect(x: 140, y: 20, width: 100, height: 30))
       // tf2.borderStyle = .roundedRect
      //  tf2.text = "0"
        
        let tf2 =  UITextField(frame: CGRect(x: 140, y: 100, width: 100, height: 30), placeholder: "0")
        
        
        
        view.addSubview(tf2)
        numText2 = tf2
        
        
        let l1 = UILabel(frame: CGRect(x: 120, y: 100, width: 20, height: 30))
        l1.text = "+"
        l1.textAlignment = .center;
        view.addSubview(l1)
        
        let l2 = UILabel(frame: CGRect(x: 240, y: 100, width: 20, height: 30))
        l2.text = "="
        l2.textAlignment = .center;
        view.addSubview(l2)
        
        let l3 = UILabel(frame: CGRect(x: 260, y: 100, width: 60, height: 30))
        l3.text = "100"
        l3.textAlignment = .right;
        view.addSubview(l3)
        
        resultLabel = l3
        
        let btn = UIButton( title: "计算")
      //  btn.setTitle("计算", for: .normal)
       // btn.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)
       // btn.sizeToFit()
        btn.center = view.center
        btn.addTarget(self, action: #selector(calc), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    func calc() {
        print(#function)
        
        
        //将文本框内容转换为数值
        //?如果文本框内容不是数字Int 之后是 nil
        guard let num1 = Int(numText1?.text ?? ""), let num2 = Int(numText2?.text ?? "") else {
            return
        }
        
        //处理结果
        resultLabel?.text = "\(num1 + num2)"
    }
    


}

