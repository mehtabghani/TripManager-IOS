//
//  LocationManager.swift
//  TripManagerApp
//
//  Created by Mehtab on 24/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import Foundation
import CoreLocation

extension LocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations");
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError");
        
    }
}

class LocationManager: NSObject {

    private var _manager : CLLocationManager?
    private var _currentLocation: CLLocation?
    
    
    static let sharedInstance = LocationManager()
    
    private override init() {
        super.init()
        setup();
    }
    
    
    func setup() {
        _manager = CLLocationManager();
        _manager!.delegate = self;
        _manager?.desiredAccuracy = kCLLocationAccuracyBest
        startMonitoring()
    }
    
    func startMonitoring() {
        
        guard _manager != nil else {
            return
        }
        _manager?.startUpdatingLocation()
    }
    
    func stopMonitoring() {
        
        guard _manager != nil else {
            return
        }
        _manager?.stopUpdatingLocation()
    }
    
    
    func getCurrentLocation() -> CLLocation? {
        
        return _currentLocation
    }
    
}
