//
//  MainViewController.swift
//  TripManagerApp
//
//  Created by Mehtab on 19/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit
import Signals
import CoreLocation

enum TripStatus {
    case start
    case end
}

class MainViewController: BaseViewController {

// MARK: - Properties
    var _manager:LocationManager?
    var _customMapView: CustomMapView?
    var _tripLocations = [CLLocation]()
    var _tripStatus:TripStatus = .end
    var _locationCount = 0
    var _lastLocation:CLLocation?
    var _user:User?
    var _startLocation:CLLocation?
    var _endLocation:CLLocation?
    var _tripStartTime:Date?
    var _tripEndTime:Date?
    
    let activityIndicator = UIActivityIndicatorView()

    
// MARK: - IBOutlet
    @IBOutlet weak var _profileImageView: UIImageView!
    @IBOutlet weak var _mapView: UIView!
    @IBOutlet weak var _btnStartTrip: UIButton!
    @IBOutlet weak var _btnEndTrip: UIButton!
    
// MARK: - Controller Events

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Trip Manager"
        setup()
        showMenuButton()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
// MARK: -

    func setup() {
        _profileImageView.layer.cornerRadius = _profileImageView.frame.height/2
        _profileImageView.layer.masksToBounds = true
        
        _manager = LocationManager.sharedInstance;

        initMapView();
        getUser();
        subscribeLocationUpdate()
    }
    
    func getUser() {
        let userId = AppConfig.sharedInstance.getUser()?.userId
        
        guard userId != nil else {
            return;
        }
        
        UserService().getUser(userID: userId!) { (response, error) in
            guard error == nil else {
                print(error!)
                return;
            }
            guard response != nil else {
                print("empty response")
                return;
            }
            
            self._user = User()
            self._user?.setUser(input: response as? NSDictionary)
            AppConfig.sharedInstance.saveUser(user: self._user!)
            
        };
        
    }

    
//MARK: - UI
    
    func initMapView() {
        
        let view: CustomMapView = UIView.fromNib()
        _customMapView = view
        _mapView.addSubview(_customMapView!)
        _mapView.bringSubview(toFront: _customMapView!)
    }
    
    func setupStartTripUI() {
        _btnStartTrip.isHidden = true
        _btnEndTrip.isHidden = false
    }
    func setupEndTripUI() {
        _btnEndTrip.isHidden = true
        _btnStartTrip.isHidden = false
    }
//MARK: -
    
    func updateMap(location: CLLocation) {
    
        //print ("Location array count: \(self._locationCount)")
        self._tripLocations.insert(location, at: self._locationCount)
        self._locationCount += 1
        self._lastLocation = location
        self._customMapView?.addMarker(location: location, title: "Location \(self._locationCount)")
    }
    
// MARK: Location Manager Signals
    
    func subscribeLocationUpdate() {
        
        _manager?.onCurrentLocationUpdate.subscribe(on: self, callback: { (location) in
            self._customMapView?.onLocationUpdate(location: location)
            
            // less than 200 meters location won't be used
            if  self._lastLocation != nil && location.distance(from: self._lastLocation!) < 200 {
                print(location.distance(from: self._lastLocation!))
                return
            }
            
            if self._tripStatus == .start {
                self.updateMap(location: location)
            }
 
        })
    }
    
// MARK: - Button Events
    @IBAction func onStartTrip(_ sender: Any) {
        setupStartTripUI()
        
        if let loc = LocationManager.sharedInstance.getCurrentLocation() {
            _tripStatus = .start
            _locationCount = 0
            updateMap(location: loc)
            _startLocation = loc
        }
    }
    
    @IBAction func onEndTrip(_ sender: Any) {
        setupEndTripUI()
        
        if let loc = LocationManager.sharedInstance.getCurrentLocation() {
            updateMap(location: loc)
            _customMapView?.drawRoute(locations: _tripLocations)
            _tripStatus = .end
            _tripLocations.removeAll()
            _endLocation = loc
            submitTrip()
  
            activityIndicator.startAnimating()
        }
    }
//Mark: - Trip Complete Methods
    
    func prepareTrip() -> Trip {
        
        let trip = Trip()
        trip.userId = _user?.userId
        trip.startLattitude = "\(_startLocation?.coordinate.latitude)"
        trip.startLongitude = "\(_startLocation?.coordinate.longitude)"
        trip.endLattitude   = "\(_endLocation?.coordinate.latitude)"
        trip.endLongitude   = "\(_endLocation?.coordinate.longitude)"
        return trip
    }
    
    func submitTrip() {
        let trip = prepareTrip()
        let tripDict = trip.getDictionary()
        
        TripService().postTrip(input: tripDict) { (response, error) in
            self.activityIndicator.stopAnimating()
            guard error == nil else {
                print(error!)
                return;
            }
            guard response != nil else {
                print("empty response")
                return;
            }
            
            let resp = response as? NSDictionary
            print(resp!)
        }
    }

}
