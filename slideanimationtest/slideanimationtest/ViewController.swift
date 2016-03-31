//
//  ViewController.swift
//  slideanimationtest
//
//  Created by Vineeth Vijayan on 09/03/16.
//  Copyright © 2016 Vineeth Vijayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var _collectionView1: UICollectionView!
    
    @IBOutlet weak var _collectionView2: UICollectionView!
    
    var imagePath =  ""
    var imagelist = [UIImage]()
    var image = UIImage()
    
    let colorList = [UIColor.redColor(), UIColor.yellowColor(), UIColor.blueColor(), UIColor.brownColor(), UIColor.cyanColor(), UIColor.greenColor() ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePath = fileInDocumentsDirectory("img.jpg")
        for _ in 0..<100{
            imagelist.append(loadImageFromPath(imagePath)!)
        }

        image = loadImageFromPath(imagePath)!
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnNextTapped(sender: AnyObject) {
        
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        _collectionView1.reloadData()
    }
    
    //Mark : Collection View
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1{
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ThumbNailCell
//            let imagePath = fileInDocumentsDirectory("img.jpg")
//            cell._img.image = loadImageFromPath(imagePath) //UIImage(named: "img1")
            cell._img.image = nil
            return cell
        }
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        return cell
//        cell.backgroundColor = colorList[indexPath.row]
    }
    
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        if collectionView.tag == 1{
            let cell1 = cell as! ThumbNailCell
            
            let qualityOfServiceClass = QOS_CLASS_USER_INITIATED
            let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
            dispatch_async(backgroundQueue, {
                print("This is run on the background queue")
                cell1._img.image =  self.imagelist[indexPath.row]//UIImage(named: "img1")
                
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    print("This is run on the main queue, after the previous code in outer block")
//                })
            })
            //            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if collectionView.tag == 1{
            return CGSize(width: 70, height: 70)
        }
        return CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.height * 0.9)
    }

    func loadImageFromPath(path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
    }
    
    func getDocumentsURL() -> NSURL {
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentsURL
    }
    
    func fileInDocumentsDirectory(filename: String) -> String {
        
        let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
        return fileURL.path!
        
    }
}

class ThumbNailCell: UICollectionViewCell {
    @IBOutlet weak var _img: UIImageView!
    
}

