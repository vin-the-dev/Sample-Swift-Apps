//
//  customview.swift
//  view_xib_open
//
//  Created by Vineeth Vijayan on 31/03/16.
//  Copyright © 2016 Vineeth Vijayan. All rights reserved.
//

import UIKit

class customview: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func backgroundBtnTapped(sender: AnyObject) {
        print("backgrond tapped")
        self.removeFromSuperview()
    }

}


extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}
