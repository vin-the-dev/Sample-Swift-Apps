//
//  CustomClass.swift
//  poplearning
//
//  Created by Vineeth Vijayan on 27/04/16.
//  Copyright © 2016 creativelogics. All rights reserved.
//

import Foundation
import UIKit
import pop

class GSSimpleImageView: UIImageView, POPAnimationDelegate {
    var tempRect: CGRect?
    var bgView: UIView!
    
    var animated: Bool = true
    
    //MARK: Life cycle
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTapGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTapGesture()
//        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private methods
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(GSSimpleImageView.fullScreenMe))
        self.addGestureRecognizer(tap)
        self.userInteractionEnabled = true
    }
    //MARK: Actions of Gestures
    func exitFullScreen () {
        let imageV = bgView.subviews[0] as! UIImageView
        
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPViewFrame)
        springAnimation.toValue = NSValue(CGRect: tempRect!)
        springAnimation.name = "SomeAnimationNameYouChooseEnding"
        springAnimation.springBounciness = 5.0
        springAnimation.delegate = self
        imageV.pop_addAnimation(springAnimation, forKey: "SomeAnimationNameYouChooseEnding")
        
        let basicAnimation = POPSpringAnimation(propertyNamed: kPOPLayerOpacity)
        basicAnimation.toValue = 0
        basicAnimation.name = "SomeAnimationNameYouChooseEnd"
        basicAnimation.delegate = self
        bgView.layer.pop_addAnimation(basicAnimation, forKey: "SomeAnimationNameYouChooseEnd")
    }
    
    func pop_animationDidReachToValue(anim: POPAnimation!) {
        if anim.name == "SomeAnimationNameYouChooseEnd" {
            bgView.removeFromSuperview()
        }
    }
    
    func pop_animationDidStop(anim: POPAnimation!, finished: Bool) {
        if anim.name == "SomeAnimationNameYouChooseEnd" {
            bgView.removeFromSuperview()
        }
    }
    
    func fullScreenMe() {
       
        if let window = UIApplication.sharedApplication().delegate?.window {
            
            let parentView = self.findParentViewController(self)!.view
            
            bgView = UIView(frame: UIScreen.mainScreen().bounds)
            bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(GSSimpleImageView.exitFullScreen)))
            bgView.backgroundColor = UIColor.blackColor()
            let imageV = UIImageView(image: self.image)
            let point = self.convertRect(self.bounds, toView: parentView)
            imageV.frame = point
            tempRect = point
            imageV.contentMode = .ScaleAspectFit
            self.bgView.addSubview(imageV)
            window?.addSubview(bgView)
            
            if animated {
                        let springAnimation = POPSpringAnimation(propertyNamed: kPOPViewFrame)
                        springAnimation.toValue = NSValue(CGRect: CGRectMake(0, 0, (parentView?.frame.width)!, (parentView?.frame.height)!))
                        springAnimation.name = "SomeAnimationNameYouChoose"
                        springAnimation.springBounciness = 10.0
                        springAnimation.delegate = self
                        imageV.pop_addAnimation(springAnimation, forKey: "SomeAnimationNameYouChoose")
            }
        }
        
    }
    
    func findParentViewController(view: UIView) -> UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.nextResponder()
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}


//extension UIView {
//    var parentViewController: UIViewController? {
//        var parentResponder: UIResponder? = self
//        while parentResponder != nil {
//            parentResponder = parentResponder!.nextResponder()
//            if let viewController = parentResponder as? UIViewController {
//                return viewController
//            }
//        }
//        return nil
//    }
//}
