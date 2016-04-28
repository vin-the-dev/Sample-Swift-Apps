//
//  CustomView.swift
//  xibviewanimate
//
//  Created by Vineeth Vijayan on 26/04/16.
//  Copyright © 2016 creativelogics. All rights reserved.
//

import Foundation
import UIKit
import EZSwiftExtensions

class CustomView: UIView {
    @IBOutlet weak var _imageView: UIImageView!
}

class CustomImageView: UIImageView{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTapGesture(target: self, action: #selector(CustomImageView.imageTapped))
    }
    
    func imageTapped() {
        print("imageTapped")
        
        let view = UIView.loadFromNibNamed("CustomView") as! CustomView
        view._imageView.image = self.image
        let superView = self.parentViewController?.view
        view.frame = self.frame
//        view.frame = self.convertRect(self.bounds, toView: superView)
        view.frame = self.convertRect(self.bounds, toView: view)
e
//        CGRect newFrame = [_senderView convertRect:windowBounds toView:nil];
//        newFrame.origin = CGPointMake(newFrame.origin.x, newFrame.origin.y);
//        newFrame.size = _senderView.frame.size;
//        _originalFrameRelativeToScreen = newFrame;
        
        
//        let newFrame = self.convertRect(<#T##rect: CGRect##CGRect#>, toView: <#T##UIView?#>)
//        let orgFrame =
        
        superView!.addSubview(view)
        UIView.animateWithDuration(1, animations: {
//            view.frame = CGRect(x: 0, y: 0, width: superView!.frame.width, height: superView!.frame.height)
            view.bounds = superView!.bounds
//            view.frame = superView!.convertRect(superView!.bounds, toView: view)
            superView?.layoutIfNeeded()
        })
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.nextResponder()
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    class func loadFromNibNamed(nibNamed: String, bundle: NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}
