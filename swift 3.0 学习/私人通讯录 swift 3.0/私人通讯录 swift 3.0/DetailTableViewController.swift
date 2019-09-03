//
//  DetailTableViewController.swift
//  私人通讯录 swift 3.0
//
//  Created by Windy on 16/10/5.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    @IBOutlet weak var nameTextF: UITextField!
    @IBOutlet weak var phoneTextF: UITextField!
    @IBOutlet weak var titleTextF: UITextField!
    
    var person: Person?
    //完成回调属性, 可选闭包
    var completionCallBack:(() ->())?  //闭包的整体

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if person != nil {
            nameTextF.text = person?.name
            phoneTextF.text = person?.phone
            titleTextF.text = person?.title
        }

       
    }

    @IBAction func savePerson(_ sender: AnyObject) {
        //1.判断person 是否为 nil,如果是就新建
        
        if person == nil{
            person = Person()
        }
        
        
        //2.UI 更新 修改过后的内容
        person?.name = nameTextF.text
        person?.phone = phoneTextF.text
        person?.title = titleTextF.text
        
        //3.执行闭包回调
        //OC 中执行 block 前必须判断是否有值,否则容易崩溃
        //! 强行解包, Xcode 自动提示经常会提示 改为 !
        //? 可选解包 -> 如果闭包为nil, 就什么也不做
        completionCallBack?()
        
        
        //4.返回上一级
        //_ 可以忽略一切不关心的内容
        _ = navigationController?.popViewController(animated: true)
    }
   
}
