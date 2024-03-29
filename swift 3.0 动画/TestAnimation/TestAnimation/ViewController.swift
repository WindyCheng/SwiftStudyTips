//
//  ViewController.swift
//  TestAnimation
//
//  Created by Sky Jean on 15/2/15.
//  Copyright (c) 2015年 com.maiziedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var width : Int = 0
    var height : Int = 0
    
    var view1 : UIView?
    var view2 : UIView?
    
    var label1 : UILabel?
    
    var damp : CGFloat = 1 {
        didSet {
            self.dampingLabel.text = "\(Int(self.damp))"
        }
    }
    var velocity : CGFloat = 1 {
        didSet {
            self.veloLable.text = "\(Int(self.velocity))"
        }
    }
    
    @IBOutlet weak var dampingLabel: UILabel!
    @IBOutlet weak var veloLable: UILabel!
    
    @IBAction func scrolled(_ sender: AnyObject) {
        let scroll : UISlider = sender as! UISlider
        self.damp = CGFloat(scroll.value)
    }

    @IBAction func veloScrolled(_ sender: AnyObject) {
        let scroll : UISlider = sender as! UISlider
        self.velocity = CGFloat(scroll.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btn = UIButton(frame: CGRect(x: 10, y: 30, width: 50, height: 20))
        btn.titleLabel?.text = "click"
        btn.addTarget(self, action: #selector(ViewController.onClick), for: UIControl.Event.touchUpInside)
        btn.backgroundColor = UIColor.darkGray
        
        self.view.addSubview(btn)
        
        let btn1 = UIButton(frame: CGRect(x: 100, y: 30, width: 50, height: 20))
        btn1.titleLabel?.text = "click"
        btn1.addTarget(self, action: #selector(ViewController.on2Click), for: UIControl.Event.touchUpInside)
        btn1.backgroundColor = UIColor.darkGray
        
        self.view.addSubview(btn1)
        
        let btn3 = UIButton(frame: CGRect(x: 190, y: 30, width: 50, height: 20))
        btn3.titleLabel?.text = "click"
        btn3.addTarget(self, action: #selector(ViewController.on3Click), for: UIControl.Event.touchUpInside)
        btn3.backgroundColor = UIColor.darkGray
        
        self.view.addSubview(btn3)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        width = Int(self.view.frame.width)
        height = Int(self.view.frame.height)
        
        view2 = UIView(frame: CGRect(x: 50, y: 100, width: 200, height: 100))
        view2?.backgroundColor = UIColor.green
        
        view1 = UIView(frame: CGRect(x: 50, y: 100, width: 200, height: 100))
        view1?.backgroundColor = UIColor.darkGray
        
        self.label1 = UILabel(frame: CGRect(x: 10, y: 10, width: 180, height: 50))
        self.label1!.text = "This is a Sample!"
        
        self.view1!.addSubview(self.label1!)
        
//        self.view.addSubview(view2!)
        self.view.addSubview(view1!)
    }
    
    @objc func on2Click() {
        self.view1!.frame = CGRect(x: 50, y: 100, width: 200, height: 100)
        view1?.backgroundColor = UIColor.darkGray
        self.view2!.frame = CGRect(x: 50, y: 100, width: 200, height: 100)
        view2?.backgroundColor = UIColor.green
    }
    
    @objc func onClick() {
//        UIView.beginAnimations("1111", context: nil)
//        UIView.setAnimationDelegate(self)
//        UIView.setAnimationDuration(1)
//        UIView.setAnimationRepeatCount(2.5)
//        UIView.setAnimationRepeatAutoreverses(true)
        
//        UIView.setAnimationDelay(1)
        
//        self.view1!.alpha = 0.2
//        self.view1!.contentStretch = CGRect(x: 10, y: 10, width: 20, height: 20)
        
//        UIView.setAnimationsEnabled(false)
//        self.view1!.backgroundColor = UIColor.yellowColor()
//        UIView.setAnimationsEnabled(true)
        
//        self.view1!.frame = CGRect(x: 100, y: 100, width: 150, height: 100)
        
//        UIView.setAnimationDidStopSelector("reverse")
        
//        UIView.commitAnimations()
        
//        UIView.animateWithDuration(1, animations: {
//            self.view1!.center = CGPoint(x: 175, y: 175)
//        })
//        UIView.animateWithDuration(1, animations: {
//            
//        }, completion: { (boo) -> Void in
//            println(" " + (boo ? "yes" : "no"))
//        })
        
//        UIView.animateWithDuration(2, delay: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
//            self.view2!.frame = CGRect(x: 75, y: 125, width: 175, height: 125)
//        }) { (boo) -> Void in
//            println("view2 complete")
//        }
//        
//        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: self.velocity, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//            self.view1!.frame = CGRect(x:100, y:150, width:150, height:150)
//        }) { (boo) -> Void in
//            println("view1 complete")
//        }
        
        
        //Nested
        UIView.animate(withDuration: 1, delay: 0.2, options: UIView.AnimationOptions.curveEaseOut, animations: { () -> Void in
            self.view1!.backgroundColor = UIColor.magenta
            
            UIView.animate(withDuration: 1, delay: 0.3, options: UIView.AnimationOptions.overrideInheritedDuration, animations: { () -> Void in
                self.view2!.frame.origin.y = 200
                self.view2!.backgroundColor = UIColor.yellow
                self.view2!.alpha = 1
            }, completion: { (finished) -> Void in
                print("nest finish")
            })
            
        }) { (finish) -> Void in
            print("outter finish")
        }
    }
    
    @objc func on3Click() {
        UIView.transition(with: self.view1!, duration: 2, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
            
        }) { (finished) -> Void in
            print("Finished:" + (finished ? "yes" : "no"))
        }
        
        let arr : NSMutableArray = [0,1,2,3]
        let index = arr.index(of: 3)
        print("\(index)")
    }
    
    func reverse() {
        UIView.animate(withDuration: 2, animations: { () -> Void in
            self.view1!.frame = CGRect(x: 50, y: 100, width: 200, height: 100)
        })
    }
    
     func animationDidStop(_ anim: CAAnimation!, finished flag: Bool) {
        print(anim.description + " has been finished")
    }
    
     func animationDidStart(_ anim: CAAnimation!) {
        print(anim.description + " did start")
    }
}

