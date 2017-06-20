//
//  TripDetailViewController.swift
//  TripManagerApp
//
//  Created by Mehtab on 20/06/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit
import CoreLocation

class TripDetailViewController: BaseViewController {
   
    private var _trip:Trip?
    var _customMapView: CustomMapView?


    
    //MARK: - Outlet
    @IBOutlet weak var _mapView: CustomMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        drawRoute()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setTrip (trip:Trip) {
        _trip = trip
    }

    func setup() {
        initMapView()
    }
    
    func initMapView() {
        
        let view: CustomMapView = UIView.fromNib()
        _customMapView = view
        _customMapView?.frame = _mapView.bounds
        _mapView.addSubview(_customMapView!)
        //_mapView.bringSubview(toFront: _customMapView!)
    }
    
    
    func drawRoute() {
        
        let startLocation = CLLocation(latitude: Double(_trip?.startLattitude! ?? "") ?? 0.0, longitude: Double(_trip?.startLongitude! ?? "") ?? 0.0)
        let endLocation = CLLocation(latitude: Double(_trip?.endLattitude! ?? "") ?? 0.0, longitude: Double(_trip?.endLongitude! ?? "") ?? 0.0)
        _customMapView?.navigateToRegion(startLocation)
        let locations = [startLocation, endLocation]
       _customMapView?.drawRoute(locations: locations)
    
    }
    
}
