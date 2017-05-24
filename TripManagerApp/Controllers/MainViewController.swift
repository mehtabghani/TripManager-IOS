//
//  MainViewController.swift
//  TripManagerApp
//
//  Created by Mehtab on 19/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    
   // var _customMapView: CustomMapView?
    
// MARK: IBOutlet
    @IBOutlet weak var _profileImageView: UIImageView!
    @IBOutlet weak var _mapView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoginIfRequired()

    }
    
    func showLoginIfRequired() {
        
        guard  AppConfig.sharedInstance.getToken() == nil else {
            setup()
            return;
        }
        
        AppDelegate.getInstance().showLoginController();
        
    }
    
    func setup() {
        _profileImageView.layer.cornerRadius = _profileImageView.frame.height/2
        _profileImageView.layer.masksToBounds = true
        
        initMapView();

    }
    
    func initMapView() {
        
        let _customMapView : CustomMapView = UIView.fromNib()
        _mapView.addSubview(_customMapView)
        _mapView.bringSubview(toFront: _customMapView)
        
        
        let manager = LocationManager.sharedInstance
        
    }
}
