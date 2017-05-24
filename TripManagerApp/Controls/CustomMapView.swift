//
//  CustomMapView.swift
//  TripManagerApp
//
//  Created by Mehtab on 24/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit
import MapKit


class CustomMapView: UIView {
    

    @IBOutlet weak var _mapView: MKMapView!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    
    }
    
    init() {
        super.init(frame: CGRect())
        
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        setup();
    }
  

    func setup() {
        guard _mapView != nil else {
            print("map not initialized")
            return;
        }
        
        // 1)
        _mapView.mapType = .standard
        
        // 2)
        var location = CLLocationCoordinate2D(latitude: 24.8615,longitude: 67.0099)
        
        if let loc = LocationManager.sharedInstance.getCurrentLocation()  {
            location = CLLocationCoordinate2D(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
        }
        
        // 3)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        _mapView.setRegion(region, animated: true)
        
        // 4)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "iOSDevCenter-Kirit Modi"
        annotation.subtitle = "Ahmedabad"
        _mapView.addAnnotation(annotation)
        
        _mapView.showsUserLocation = true;
        
    }
    
    func navigateTo(_ coordinates:CLLocation?) {
        if let loc = coordinates  {
           let location = CLLocationCoordinate2D(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
        }
    }
    
    
}
