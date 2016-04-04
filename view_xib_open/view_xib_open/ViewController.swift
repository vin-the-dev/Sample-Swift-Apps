//
//  ViewController.swift
//  view_xib_open
//
//  Created by Vineeth Vijayan on 31/03/16.
//  Copyright © 2016 Vineeth Vijayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	override func viewWillAppear(animated: Bool) {
	}

	@IBOutlet weak var _btnShowView: UIButton!
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	@IBAction func showViewTapped(sender: AnyObject) {
		let view = customview.loadFromNibNamed("customview")
		view!.frame = self.view.frame
		self.view.addSubview(view!)
        
//		let view = UIView()
//		view.backgroundColor = UIColor.redColor()
//		view.frame = self.view.frame
//		self.view.addSubview(view)
	}
}
