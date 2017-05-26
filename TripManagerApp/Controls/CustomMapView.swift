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
    

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        polylineRenderer.strokeColor = UIColor.blue
        polylineRenderer.lineWidth = 5
        return polylineRenderer
    }
}

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
        _mapView.delegate = self
        
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
    
    func addMarker(location: CLLocation?, title:String) {
        
        guard location != nil else {
            return
        }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = getCoordinates(location: location!);
        annotation.title = title
        _mapView.addAnnotation(annotation)

    }
    
    func removeMarker(annotation: MKPointAnnotation?)  {
        
        guard annotation != nil else {
            return
        }
        
        _mapView.removeAnnotation(annotation!)
}
    
  // MARK: Draw Route
    
    func drawRoute(startLocation: CLLocation, endLocation: CLLocation) {
    
        let startCord = getCoordinates(location: startLocation)
        let endCord = getCoordinates(location: endLocation)
        let coordinates = [startCord, endCord]
        
        let poly = MKPolyline(coordinates: coordinates, count: 2)
        _mapView.setVisibleMapRect(poly.boundingMapRect, animated: false)
        _mapView.add(poly)
        
        //let geodesic = MKGeodesicPolyline(coordinates: coordinates, count: 2)
       // _mapView.add(geodesic)
    }
    
    
    func drawRoute(locations:[CLLocation]) {
        var coordinates = [CLLocationCoordinate2D]()

        var i = 0
        for location in locations {
            coordinates.insert(getCoordinates(location: location), at: i)
            i += 1

        }
        
        let poly = MKPolyline(coordinates: coordinates, count: coordinates.count)
        _mapView.setVisibleMapRect(poly.boundingMapRect, animated: false)
        _mapView.add(poly)
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



    


