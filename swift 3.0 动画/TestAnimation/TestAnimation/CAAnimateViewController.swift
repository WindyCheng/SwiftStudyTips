//
//  CAAnimateViewController.swift
//  TestAnimation
//
//  Created by Sky Jean on 15/4/9.
//  Copyright (c) 2015年 com.maiziedu. All rights reserved.
//

import UIKit

class CAAnimateViewController: UIViewController {
    
    var myLayer : CALayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: 操作部分
    @IBAction func startClicked(_ sender: AnyObject) {
//        self.caBasicAnimate()
//        self.implicitAnimate()
//        self.keyFrameAnimate()
//        self.testLayerProperty()
//        self.implicitAnimation()
        self.newBasicAnimate()
//        self.newKeyFrameAnimate()
    }

    @IBAction func fallbackClicked(_ sender: AnyObject) {
   
        
        
       // let subsArray = self.view.subviews as NSArray
        
        
      /*  for view in self.view.subviews {
            if view is UIImageView {
                view.removeFromSuperview()
            }
        }
        */
        
        let _ = self.view.subviews.map({ ($0 as? UIImageView)?.removeFromSuperview() })
  /*       for view in subsArray {
         if (view as AnyObject).isKind(UIImageView) as Bool {
         (view as AnyObject).removeFromSuperview()
         }
    }
 */
        


        
  /*      var subsArray = self.view.subviews as NSArray
        for view in subsArray {
            if view.isKindOfClass(UIImageView) {
                view.removeFromSuperview()
            }
        }
 */

    }

    @IBAction func stopClicked(_ sender: AnyObject) {
    }

    //MARK: 动画方法部分
    func caBasicAnimate() {
        let imgView = UIImageView(image: UIImage(named: "maiziLogo")!)
        imgView.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(imgView)
        
        let la = imgView.layer
        
        let scaleAni = CABasicAnimation(keyPath: "transform.scale")
        scaleAni.fromValue = 1.0
        scaleAni.toValue = 1.2
        scaleAni.autoreverses = true
        scaleAni.fillMode = CAMediaTimingFillMode.forwards
        scaleAni.repeatCount = MAXFLOAT
        scaleAni.duration = 1.0
        
        let opacityAni = CABasicAnimation(keyPath: "opacity")
        opacityAni.fromValue = 0.3
        opacityAni.toValue = 1.0
        opacityAni.fillMode = CAMediaTimingFillMode.forwards
        opacityAni.duration = 1.0
        opacityAni.autoreverses = true
        opacityAni.repeatCount = MAXFLOAT
        
        la.add(scaleAni, forKey: "group")
        la.add(opacityAni, forKey: "opa")
    }
    
    func newBasicAnimate() {
        let imgView = UIImageView(image: UIImage(named: "maiziLogo")!)
        imgView.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(imgView)
        
        //1,选定角色CALayer
        let layer = imgView.layer
        
        //2,写第一个剧本变形CAAnimation
        let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = 1.0
        scaleAnimate.toValue = 1.5
        scaleAnimate.autoreverses = true
        scaleAnimate.repeatCount = MAXFLOAT
        scaleAnimate.duration = 2.0
        
        //3,写第二个剧本用来透明
        let opaqueAnimate = CABasicAnimation(keyPath: "opacity")
        opaqueAnimate.fromValue = 0.0
        opaqueAnimate.toValue = 1.0
        opaqueAnimate.autoreverses = true
        opaqueAnimate.repeatCount = MAXFLOAT
        opaqueAnimate.duration = 2.0
        
        //4,把剧本交给演员开始动画
        layer.add(scaleAnimate, forKey: "scaleAnimate")
        layer.add(opaqueAnimate, forKey: "opaqueAnimate")
        
    }
    
    func implicitAnimate() {
        let imgView = UIImageView(image: UIImage(named: "maiziLogo")!)
        imgView.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(imgView)
        imgView.alpha = 0.3

        UIView.animate(withDuration: 1, delay: 0, options: [.repeat , .autoreverse], animations: { () -> Void in
            imgView.frame = CGRect(x: 140, y: 190, width: 120, height: 120)
            imgView.alpha = 1.0
        }) { (finished) -> Void in
            print("finished")
        }
    }
    
    func keyFrameAnimate() {
        let imgView = UIImageView(image: UIImage(named: "maiziLogo")!)
        imgView.frame = CGRect(x: 200, y: 200, width: 40, height: 40)
        self.view.addSubview(imgView)
        
        let la = imgView.layer
        
        let keyAni = CAKeyframeAnimation(keyPath: "position")
        //values
        let value0 = NSValue(cgPoint: la.frame.origin)
        let value1 = NSValue(cgPoint: CGPoint(x: la.frame.origin.x, y: la.frame.origin.y + 100))
        let value2 = NSValue(cgPoint: CGPoint(x: la.frame.origin.x - 150, y: la.frame.origin.y + 100))
        let value3 = NSValue(cgPoint: CGPoint(x: la.frame.origin.x - 150, y: la.frame.origin.y))
        let value4 = NSValue(cgPoint: la.frame.origin)
        keyAni.values = [value0, value1, value2, value3, value4]
        
        //frame Times
//        keyAni.keyTimes = [0.0, 0.6, 0.7, 0.8, 0.5]
        
//        var timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        keyAni.timingFunctions = [timingFunction, timingFunction, timingFunction, timingFunction, timingFunction]
        
        keyAni.repeatCount = 100
        keyAni.autoreverses = false
        keyAni.calculationMode = CAAnimationCalculationMode.linear
        keyAni.duration = 3
        
        let scaleAni = CABasicAnimation(keyPath: "transform.scale.y")
        scaleAni.fromValue = 1.0
        scaleAni.toValue = 0.1
        scaleAni.autoreverses = true
        scaleAni.fillMode = CAMediaTimingFillMode.forwards
        scaleAni.repeatCount = MAXFLOAT
        scaleAni.duration = 0.2
        
//        la.addAnimation(scaleAni, forKey: "scale")
        la.add(keyAni, forKey: "keyAni")
    }
    
    func newKeyFrameAnimate() {
        let imgView = UIImageView(image: UIImage(named: "maiziLogo")!)
        imgView.frame = CGRect(x: 150, y: 200, width: 40, height: 40)
        self.view.addSubview(imgView)
        
        //1,选定角色CALayer
        let layer = imgView.layer
        
        //2,写剧本
        let keyAnimate = CAKeyframeAnimation(keyPath: "position")
        //3,设定关键帧
        let value0 = NSValue(cgPoint: layer.position)
        let value1 = NSValue(cgPoint: CGPoint(x: layer.position.x, y: layer.position.y + 200))
        let value2 = NSValue(cgPoint: CGPoint(x: layer.position.x - 150, y: layer.position.y + 200))
        let value3 = NSValue(cgPoint: CGPoint(x: layer.position.x - 150, y: layer.position.y))
        let value4 = NSValue(cgPoint: layer.position)
        keyAnimate.values = [value0, value1, value2, value3, value4]
        
        keyAnimate.keyTimes = [0.0, 0.5, 0.6, 0.7, 1]
        
        let tf0 = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        let tf1 = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        let tf2 = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        let tf3 = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        keyAnimate.timingFunctions = [tf0, tf1, tf2, tf3]
        
        keyAnimate.autoreverses = false
        keyAnimate.repeatCount = MAXFLOAT
        keyAnimate.duration = 6.0
        
        //4，start
        layer.add(keyAnimate, forKey: "keyAnimate")
    }
    
    func testLayerProperty() {
        myLayer = CALayer()
        myLayer.backgroundColor = UIColor.magenta.cgColor
        myLayer.borderColor = UIColor.orange.cgColor
        myLayer.borderWidth = 5.0
        myLayer.cornerRadius = 10.0
        myLayer.shadowColor = UIColor.white.cgColor
        myLayer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        myLayer.shadowOpacity = 0.2
        myLayer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        self.view.layer.addSublayer(myLayer)
    }
    
    func implicitAnimation() {
        myLayer.position.y += 300
    }
}
