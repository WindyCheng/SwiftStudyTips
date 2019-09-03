//
//  ListTableViewController.swift
//  私人通讯录 swift 3.0
//
//  Created by Windy on 16/10/5.
//  Copyright © 2016年 Windy. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    //联系人数组
    var personList = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData { (list) in
            print(list)
            
            //'拼接数组',闭包中定义好的代码在需要的时候执行,需要 self.指定语境
            self.personList += list
            
            //刷新表格
            self.tableView.reloadData()
        }

    }
    
    
    private func loadData(completion:@escaping (_ list:[Person]) ->()) -> () {
        DispatchQueue.global().async {
            print("正在努力加载中......")
            Thread.sleep(forTimeInterval: 1)
            var arrayM = [Person]()
            for i in 0..<20{
                let p = Person()
                p.name = "张三 -- \(i)"
                p.phone = "1860" + String(format: "%06d", arc4random_uniform(1000000))
                p.title = "BOSS"
                arrayM.append(p)
            }
            //主线程回调
            DispatchQueue.main.sync(execute: {
                //回调执行闭包
                completion(arrayM)
            })
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personList.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = personList[indexPath.row].name! + personList[indexPath.row].title!
        cell.detailTextLabel?.text = personList[indexPath.row].phone


        return cell
    }
    
    @IBAction func newPerson(_ sender: AnyObject){
        
        performSegue(withIdentifier: "list2detail", sender: nil)
    }
    //MARK:- 控制器跳转方法
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //类型转换
        //swift 中String 之外, 绝大多数 使用 as 需要 ?/!
        //as! / as? 直接根据前面的返回值来决定
        // if let / guard let 判空语句,一律使用 as?
        let vc = segue.destination as! DetailTableViewController
        if let indexPath = sender as? IndexPath{
            //indexPath 一定有值
            vc.person = personList[indexPath.row];
            //设置编辑完成的闭包
            vc.completionCallBack = {
                //刷新指定行
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }else{
            //新建个人记录             //解决循环引用
            vc.completionCallBack = {[weak vc] in
                //1.获取明细控制器的 person
                guard let p = vc?.person else {
                    return
                }
                //2.插入到数组顶部
                self.personList.insert(p, at: 0)
                //3.刷新表格
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - 代理方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "list2detail", sender: indexPath)
    }
}
