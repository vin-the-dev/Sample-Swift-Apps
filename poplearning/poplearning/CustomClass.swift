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

class GSSimpleImageView: UIImageView {
    
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
        bgView.removeFromSuperview()
    }
    
    func fullScreenMe() {
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPViewAlpha)
        springAnimation.toValue = NSValue(CGPoint: CGPointMake(0.8, 0.8))
        springAnimation.velocity = NSValue(CGPoint: CGPointMake(2, 2))
        springAnimation.springBounciness = 20.0
        self.pop_addAnimation(springAnimation, forKey: "springAnimation")
        
    }
    
}