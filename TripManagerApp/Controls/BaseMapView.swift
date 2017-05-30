//
//  BaseMapView.swift
//  TripManagerApp
//
//  Created by Mehtab on 30/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit
import MapKit


class BaseMapView: UIView {

  
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Marker
    
    func addMarker(mapView: MKMapView, location: CLLocation?, title:String) {
        
        guard location != nil else {
            return
        }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location!.coordinate
        annotation.title = title
        mapView.addAnnotation(annotation)
        
    }
    
    func removeMarker(mapView: MKMapView, annotation: MKPointAnnotation?)  {
        
        guard annotation != nil else {
            return
        }
        
        mapView.removeAnnotation(annotation!)
    }
    
    // MARK: Draw Route
    
    func drawRoute(mapView: MKMapView, startLocation: CLLocation, endLocation: CLLocation) {
        
        let startCord = startLocation.coordinate
        let endCord = endLocation.coordinate
        let coordinates = [startCord, endCord]
        
        let poly = MKPolyline(coordinates: coordinates, count: coordinates.count)
        mapView.setVisibleMapRect(poly.boundingMapRect, animated: false)
        mapView.add(poly)
    }
    
    
    func drawRoute(mapView: MKMapView, locations:[CLLocation]) {
        var coordinates = [CLLocationCoordinate2D]()
        
        var i = 0
        for location in locations {
            coordinates.insert(location.coordinate, at: i)
            i += 1
            
        }
        
        let geodesic = MKGeodesicPolyline(coordinates: coordinates, count: coordinates.count)
        mapView.add(geodesic)
    }
    

}
