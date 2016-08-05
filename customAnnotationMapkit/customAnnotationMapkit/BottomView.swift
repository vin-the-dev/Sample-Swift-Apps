//
//  BottomView.swift
//  customAnnotationMapkit
//
//  Created by Vineeth Vijayan on 06/06/16.
//  Copyright © 2016 creativelogics. All rights reserved.
//

import Foundation
import UIKit

class BottomView: UIView {
  
    @IBOutlet weak internal var _lbl: UILabel!
}

extension UIView{
    class func loadFromNibNamed(nibNamed: String, bundle: NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}