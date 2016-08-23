//
//  NewViewController.swift
//  samlesocket
//
//  Created by Vineeth Vijayan on 22/08/16.
//  Copyright © 2016 Vineeth Vijayan. All rights reserved.
//

import Foundation
import UIKit

class NewViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    
    var cellTapped: Bool = false
    var currentRow = -1;
    var isAnimated: Bool = false
    
    @IBOutlet weak var _tableView: UITableView!
    
    override func viewDidLoad() {
        
    }
    
    //MARK: Table View
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! testCell
        cell._lbl1.text = indexPath.row.description
        
        cell._btnExpand.tag = indexPath.row
        cell._btnExpand.addTarget(self, action: #selector(NewViewController.btnExpandClicked), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        print("cellforIndex")
        print(currentRow)
        print(indexPath.row)
        UIView.animateWithDuration(0.5, animations: {
            if indexPath.row == self.currentRow {
                    print("current row activated")
                    cell._expandBtnTopConstraint.priority = 1
                    cell._expandBtnBottomConstraint.priority = 999
                    cell._expandBtnTrailingConstraint.priority = 1
                    cell._expandBtnleadingConstraint.priority = 999
            }
            else{
                print("old row deactivated")
                cell._expandBtnBottomConstraint.priority = 1
                cell._expandBtnTopConstraint.priority = 999
                cell._expandBtnTrailingConstraint.priority = 999
                cell._expandBtnleadingConstraint.priority = 1
            }
            cell.contentView.layoutIfNeeded()
        })
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
       
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! testCell
        
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == currentRow {
            return 141
        }
        return 70
    }
    
    
    func btnExpandClicked(sender: UIButton) {
        print("Expand")
        
        print(currentRow)
        print(sender.tag)
        
        cellTapped = true
        let oldIndexPath = NSIndexPath(forRow: currentRow, inSection: 0)
        currentRow = sender.tag
        let indexPath = NSIndexPath(forRow: sender.tag, inSection: 0)
        
        _tableView.reloadRowsAtIndexPaths([indexPath,oldIndexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
        _tableView.beginUpdates()
        _tableView.endUpdates()
        
    }
}

class testCell: UITableViewCell {
    @IBOutlet weak var _lbl1: UILabel!
    @IBOutlet weak var _btnExpand: UIButton!
    
    
    @IBOutlet weak var _expandBtnTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var _expandBtnBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var _expandBtnleadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var _expandBtnTrailingConstraint: NSLayoutConstraint!
}
