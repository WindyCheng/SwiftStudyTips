
//
//  NextViewController.swift
//  TestAnimation
//
//  Created by Sky Jean on 15/3/24.
//  Copyright (c) 2015年 com.maiziedu. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var mBtn1: UIButton!
    @IBOutlet weak var mBtn2: UIButton!
    @IBOutlet weak var mBtn3: UIButton!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    var frame1 : CGRect!
    var frame2 : CGRect!
    
    var color1 : UIColor!
    var color2 : UIColor!
    
    var mSubView : UIView?
    
    @IBOutlet weak var mSubLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        var dic = ["a":"a", "b":"b", "c":"c"]
//        var arr = dic.keys.array as NSArray
//        var sort = NSSortDescriptor(key: "", ascending: true)
//        var arrSorted = arr.sortedArrayUsingDescriptors([sort])
//        println(arrSorted)
        
        self.frame1 = self.firstView.frame
        self.frame2 = self.secondView.frame
        
        self.color1 = self.firstView.backgroundColor
        self.color2 = self.secondView.backgroundColor
        
        let a = NSArray(array: [111,222,333])
        a.object(at: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btn1Click(_ sender: AnyObject) {
//        self.nestedAnimate()
//        self.transitSubview()
//        self.replaceView(UIView())
        self.animateViewAndLayerTogether()
//        self.animateWithBeginCommit()
//        self.caBasicAnimate()
    }
    
    @IBAction func btn2Click(_ sender: AnyObject) {
        self.firstView.frame = self.frame1
        self.secondView.frame = self.frame2
        
        self.firstView.backgroundColor = self.color1
        self.secondView.backgroundColor = self.color2
        
        self.mSubView?.removeFromSuperview()
    }
    
    @IBAction func btn3Click(_ sender: AnyObject) {
        mSubView = UIView(frame: CGRect(x: 5, y: 5, width: 50, height: 50))
        mSubView!.backgroundColor = UIColor.purple
        
        self.firstView.addSubview(mSubView!)
    }
    
    func animateWithBeginCommit() {
        UIView.beginAnimations("firstAnimate", context: nil)
        UIView.setAnimationDuration(1.0)
        UIView.setAnimationDelegate(self)
        
        self.firstView.backgroundColor = UIColor.magenta
        
        UIView.commitAnimations()
        
    }
    
     func animationDidStart(_ : CAAnimation!)  {
        print("animate start")
    }
    
     func animationDidStop(_ : CAAnimation!, finished flag: Bool){
        print("animate stop")
    }
    
  /*  override func animationDidStart(_ anim: CAAnimation!) {
        print("animate start")
    }*/
    
  /*  override func animationDidStop(_ anim: CAAnimation!, finished flag: Bool) {
        print("animate stop")
    } */
    
    func nestedAnimate() {
        UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: { () -> Void in
            self.firstView.frame.origin.x += 100
            
//            UIView.animateWithDuration(3, animations: { () -> Void in
//                self.secondView.frame.origin.y += 100
//            })
            
            UIView.animate(withDuration: 1, delay: 0, options: [.overrideInheritedCurve, .curveEaseInOut,.overrideInheritedDuration ,.overrideInheritedOptions], animations: { () -> Void in
                self.secondView.frame.origin.x += 100
            }, completion: { (finish) -> Void in
                print("nest finished")
            })
            
            }) { (finish) -> Void in
                print("finished")
        }
    }
    
    func test () {
        UIView.animate(withDuration: 1, animations: { () -> Void in
            //            self.mSubView!.hidden =  true
            self.mSubView!.backgroundColor = UIColor.darkGray
            self.mSubView!.frame.origin.x += 80
            self.firstView.backgroundColor = UIColor.orange
        }, completion: { (finish) -> Void in
            print("finished")
        })
    }
    
    func transitSubview() {
        UIView.transition(with: self.firstView, duration: 1, options: [.transitionCrossDissolve , .allowAnimatedContent], animations: { () -> Void in
//            self.mSubView!.hidden =  true
            self.mSubView!.backgroundColor = UIColor.darkGray
            self.mSubView!.frame.origin.x += 80
            self.firstView.backgroundColor = UIColor.orange
        }) { (finish) -> Void in
            print("finished")
        }
    }
    
    func replaceView(_ view:UIView) {
        view.frame = CGRect(x: 30, y: 200, width: 100, height: 50)
        view.backgroundColor = UIColor.magenta
        UIView.transition(from: firstView, to:view, duration:2, options:[.transitionCrossDissolve, .allowAnimatedContent]){(finish) ->() in
            print("finished")
        }
 
    }
    
    func animateViewAndLayerTogether() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: { () -> Void in
            
            let angle = CGFloat(180.0 * Double.pi / 180.0)
            
            let xform = CGAffineTransform(rotationAngle: angle)
            self.firstView.transform = xform
            
            let layerAnimate = CABasicAnimation(keyPath: "transform")
            layerAnimate.duration = 1.0
            layerAnimate.beginTime = 0
            layerAnimate.valueFunction = CAValueFunction(name: CAValueFunctionName.scaleY)
            layerAnimate.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            layerAnimate.fromValue = NSNumber(value: 0.0 as Double)
            layerAnimate.toValue = NSNumber(value: (360.0 * Double.pi / 180.0) as Double)
            layerAnimate.byValue = NSNumber(value: (180.0 * Double.pi / 180.0) as Double)
            self.secondView.layer.add(layerAnimate, forKey: "layerAnimation")
        }) { (finish) -> Void in
            print("finished")
        }
    }
}
