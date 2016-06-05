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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let anno = MKPointAnnotation()
        anno.title = "Delhi"
        anno.coordinate = CLLocationCoordinate2D(latitude: 28.6139, longitude: 77.2090)
        _mapView.addAnnotation(anno)
        // 28.6139° N, 77.2090° E
        
        createPolyline(_mapView)
        
        
        //Title overlay
        
        let title = MKTileOverlay()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annoView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        
        let tempView = UIView()
        
        let btn = UIButton()
        btn.addTarget(self, action: #selector(ViewController.btnTapped), forControlEvents: UIControlEvents.TouchUpInside)
        btn.backgroundColor = .redColor()
        btn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        tempView.backgroundColor = .greenColor()
        
        let widthConstraint = NSLayoutConstraint(item: tempView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 200)
        tempView.addConstraint(widthConstraint)
        
        let heightConstraint = NSLayoutConstraint(item: tempView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 150)
        tempView.addConstraint(heightConstraint)
        
        tempView.addSubview(btn)
        
        annoView.detailCalloutAccessoryView =  tempView
        
        annoView.canShowCallout =  true
        
        let lbl = UILabel(frame: CGRectMake(10, 0, 50, 20))
        lbl.text = "Delhi"
        lbl.textColor = UIColor.blueColor()
        annoView.addSubview(lbl)
        annoView.frame = lbl.frame
        
        return annoView
    }

    func btnTapped(){
        print("btnTapped")
        _mapView.deselectAnnotation(_mapView.annotations[0], animated: true)
    }
    
    func createPolyline(mapView: MKMapView) {
        var point1 = CLLocationCoordinate2DMake(28.6139, 77.2090);
        var point2 = CLLocationCoordinate2DMake(19.0760, 72.8777);
//        var point3 = CLLocationCoordinate2DMake(-73.757201, 41.019267);
//        var point4 = CLLocationCoordinate2DMake(-73.757482, 41.016375);
//        var point5 = CLLocationCoordinate2DMake(-73.761105, 41.017791);
        
        var points: [CLLocationCoordinate2D]
        points = [point1, point2] //, point3, point4, point5]
        
        var geodesic = MKGeodesicPolyline(coordinates: &points, count: points.count)
        
        
        mapView.addOverlay(geodesic)
        
//        UIView.animateWithDuration(1.5, animations: { () -> Void in
//            let span = MKCoordinateSpanMake(0.01, 0.01)
//            let region1 = MKCoordinateRegion(center: point1, span: span)
//            self._mapView.setRegion(region1, animated: true)
//        })
    }

    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer! {
        if overlay is MKPolyline {
            let lineView = MKPolylineRenderer(overlay: overlay)
            
            lineView.strokeColor = UIColor.redColor()
            lineView.lineWidth = 1
            
            lineView.lineDashPattern = [2, 5]
            
            return lineView
        }
        return nil
    }
}

