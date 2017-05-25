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
    
    var _currentLocation: CLLocation?
    
    
// MARK: Outlets
    @IBOutlet weak var _mapView: MKMapView!

    
//MARK: Init
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
  
//MARK: -

    func setup() {
        guard _mapView != nil else {
            print("map not initialized")
            return;
        }
        
        // 1)
        _mapView.mapType = .standard
        
        // 2)
        var location = CLLocationCoordinate2D(latitude: 37.331705,longitude: -122.030237)
        
        if let loc = LocationManager.sharedInstance.getCurrentLocation()  {
            location = CLLocationCoordinate2D(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
        }
    
        // 3)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        _mapView.setRegion(region, animated: true)

        
        _mapView.showsUserLocation = true;
        
    }
    
    func getCoordinates(location:CLLocation) -> CLLocationCoordinate2D {
        
        return CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)

    }
    
    func navigateToRegion(_ location:CLLocation?) {
        if let loc = location  {
            let coordinates = getCoordinates(location: loc)
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: coordinates, span: span)
            _mapView.setRegion(region, animated: false)
        }
        
    }
// MARK: - Marker
    
    func addMarker(location: CLLocation?, title:String) -> MKPointAnnotation? {
        
        guard location != nil else {
            return nil
        }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = getCoordinates(location: location!);
        annotation.title = title
        _mapView.addAnnotation(annotation)
        return annotation

    }
    
    func removeMarker(annotation: MKPointAnnotation?)  {
        
        guard annotation != nil else {
            return
        }
        
        _mapView.removeAnnotation(annotation!)
  
}
    
 // MARK: - Location Update Evenet
    
    func onLocationUpdate(location: CLLocation?) {
    
        if let loc = location  {
            
            if _currentLocation == nil {
                _currentLocation = loc
                navigateToRegion(_currentLocation)
            }
            
        }

    }
    
    
}
