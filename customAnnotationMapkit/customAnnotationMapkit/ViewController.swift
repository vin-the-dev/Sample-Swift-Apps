//
//  ViewController.swift
//  customAnnotationMapkit
//
//  Created by Vineeth Vijayan on 04/06/16.
//  Copyright © 2016 creativelogics. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var _mapView: MKMapView!
    
    @IBOutlet weak var _constraintBottomView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._constraintBottomView.constant = 125
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func bottomViewCloseTapped(sender: AnyObject) {
        UIView.animateWithDuration(0.5, animations: {
            self._constraintBottomView.constant = 125
            self.view.layoutIfNeeded()
            }, completion: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let anno = MKPointAnnotation()
<<<<<<< HEAD
        anno.title = "Title"
=======
        anno.title = "Thiruvananthapuram"
>>>>>>> origin/master
        anno.coordinate = CLLocationCoordinate2D(latitude: 28.6139, longitude: 77.2090)
        _mapView.addAnnotation(anno)
        // 28.6139° N, 77.2090° E
        
//        createPolyline(_mapView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annoView = CustomAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        
        annoView.canShowCallout =  true
        
<<<<<<< HEAD
        annoView.alpha = 0
        UIView.animateWithDuration(0.5, animations: {
            annoView.alpha = 1
        })
=======
        let btn = UIButton()
        btn.addTarget(self, action: "btnTapped", forControlEvents: UIControlEvents.TouchUpInside)
        btn.backgroundColor = .redColor()
        btn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
>>>>>>> origin/master
        
        let tempView = UIView.loadFromNibNamed("PopUpUIView") as! PopUpUIView
        
        let widthConstraint = NSLayoutConstraint(item: tempView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 200)
        tempView.addConstraint(widthConstraint)
        
        let heightConstraint = NSLayoutConstraint(item: tempView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 300)
        tempView.addConstraint(heightConstraint)
        
        tempView._btnClose.addTarget(self, action: #selector(ViewController.btnTapped), forControlEvents: UIControlEvents.TouchUpInside)
        
        annoView.detailCalloutAccessoryView =  tempView
        
<<<<<<< HEAD
=======
        annoView.canShowCallout =  true
        
        
        let lbl = UILabel(frame: CGRectMake(10, 0, 100, 20))
        lbl.text = "AVBSH ASJD AJSDHJKAS HDAHJK"
//        lbl.backgroundColor = UIColor.redColor()
        lbl.textColor = UIColor.blueColor()
        
        annoView.addSubview(lbl)
        
        annoView.frame = lbl.frame
        
//        let lblView = UIView.loadFromNibNamed("BottomView") as! BottomView
//        
//        let str: NSString =  "Thiruvananthapuram"
////        let width = str.sizeWithAttributes(nil).width
//        
//        let size: CGSize = str.sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(12.0)])
//        
//        print(size)
//        
//        lblView.frame = CGRectMake(10, -10, 130, 10)
//        lblView._lbl.attributedText = NSAttributedString(string: str as String)
//        
//        annoView.addSubview(lblView)
//        
//        annoView.frame = lblView.frame
        
>>>>>>> origin/master
        return annoView
    }

    func btnTapped(){
        print("btnTapped")
        _mapView.deselectAnnotation(_mapView.annotations[0], animated: true)
        
        UIView.animateWithDuration(0.5, animations: {
            self._constraintBottomView.constant = 0
            self.view.layoutIfNeeded()
            }, completion: nil)
        
    }
    
    func createPolyline(mapView: MKMapView) {
        let point1 = CLLocationCoordinate2DMake(28.6139, 77.2090);
        let point2 = CLLocationCoordinate2DMake(19.0760, 72.8777);
//        var point3 = CLLocationCoordinate2DMake(-73.757201, 41.019267);
//        var point4 = CLLocationCoordinate2DMake(-73.757482, 41.016375);
//        var point5 = CLLocationCoordinate2DMake(-73.761105, 41.017791);
        
        var points: [CLLocationCoordinate2D]
        points = [point1, point2] //, point3, point4, point5]
        
        let geodesic = MKGeodesicPolyline(coordinates: &points, count: points.count)
        
        let geodesic1 = MKPolyline(coordinates: &points, count: points.count)
        
        mapView.addOverlay(geodesic)
        mapView.addOverlay(geodesic1)
        
//        UIView.animateWithDuration(1.5, animations: { () -> Void in
//            let span = MKCoordinateSpanMake(0.01, 0.01)
//            let region1 = MKCoordinateRegion(center: point1, span: span)
//            self._mapView.setRegion(region1, animated: true)
//        })
    }

    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let lineView = MKPolylineRenderer(overlay: overlay)
            
            lineView.strokeColor = UIColor.redColor()
            lineView.lineWidth = 1
            
            lineView.lineDashPattern = [2, 5]
            
            return lineView
        }
        return MKOverlayRenderer()
//        return nil
    }
}
