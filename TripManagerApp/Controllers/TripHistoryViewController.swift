//
//  TripHistoryViewController.swift
//  TripManagerApp
//
//  Created by Mehtab on 13/06/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit




class TripHistoryViewController: BaseViewController {
    
    let activityIndicator = UIActivityIndicatorView()
    var trips:Array<Trip>?
    let cellReuseIdentifier = "cell"      // cell reuse id (cells that scroll out of view can be reused)

    
    //MARK: - Outlet
    
    @IBOutlet weak var _tripTableView: UITableView!
    
    //MARK: - Outlet

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.startAnimating()
    }
    
    func setup() {
        title = "Trip History"
        showMenuButton()
        getTrips()
        setupTableView()
    }
    func setupTableView() {
        
        // Register the table view cell class and its reuse id
        _tripTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        _tripTableView.delegate = self
        _tripTableView.dataSource = self
    }
    
    func getTrips() {
        
        let service = TripService()
        let userId = AppConfig.sharedInstance.getUser()?.userId
        service.getTrips(userId: userId!) { (response, error) in
            
            self.activityIndicator.stopAnimating()

            guard error == nil else {
                return;
            }
            
            if response != nil {
                self.prepareTripsDictionary(response: (response as! NSArray))
            }
        }
    }
    
    func prepareTripsDictionary (response: NSArray) {
        
        trips = []
        
        for resp in response {
            let trip = Trip()
            trip.set(input: resp as? NSDictionary)
            trips?.append(trip)
        }
        
        _tripTableView.reloadData()
    }
    
}

extension TripHistoryViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip:Trip = (trips?[indexPath.row])!

        AppDelegate.getInstance().showTripDetailController(trip: trip)
    }
}

extension TripHistoryViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = _tripTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        let trip:Trip = (trips?[indexPath.row])!

        cell.textLabel?.text = "\(trip.getStartDateString()) - \(trip.getEndDateString()) "
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard trips != nil else {
            return 0
        }
        
        return trips!.count
    }
    
}

