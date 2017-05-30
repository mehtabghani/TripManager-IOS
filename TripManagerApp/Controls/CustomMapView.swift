//
//  CustomMapView.swift
//  TripManagerApp
//
//  Created by Mehtab on 24/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit
import MapKit

extension CustomMapView : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
       // print("Current Location: \(userLocation.coordinate)")
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        polylineRenderer.strokeColor = UIColor.blue
        polylineRenderer.lineWidth = 5
        return polylineRenderer
    }
}

class CustomMapView: BaseMapView {
    
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
        _mapView.delegate = self
        
    }
    
    func navigateToRegion(_ location:CLLocation?) {
        if let loc = location  {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: loc.coordinate, span: span)
            _mapView.setRegion(region, animated: false)
        }
        
    }
    
    
    func addMarker( location: CLLocation?, title: String) {
        super.addMarker(mapView: _mapView, location: location, title: title)
    }
    
    func drawRoute(locations:[CLLocation]) {
        super.drawRoute(mapView: _mapView, locations: locations)
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



    


