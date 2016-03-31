//
//  ViewController.swift
//  tableviewanimation
//
//  Created by Vineeth Vijayan on 20/03/16.
//  Copyright © 2016 Vineeth Vijayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark Table View
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = indexPath.row.description
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    var headerCell = HeaderCell()

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerCell = tableView.dequeueReusableCellWithIdentifier("headercell") as! HeaderCell
        
        return headerCell.contentView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 130
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
//        let frame = headerCell.frame
//        frame.height.advancedBy(-1)
        headerCell._constraintBottomMarginLabel.constant += 1
        headerCell.contentView.frame.size.height -= 1
        print(scrollView.contentOffset)
    }

}

class HeaderCell: UITableViewCell {
    @IBOutlet weak var _constraintBottomMarginLabel: NSLayoutConstraint!
    
}

