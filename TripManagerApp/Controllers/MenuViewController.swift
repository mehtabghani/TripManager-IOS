//
//  MenuViewController.swift
//  TripManagerApp
//
//  Created by Mehtab on 30/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {
    
    
    //MARK: Outlet
    
    @IBOutlet weak var _profileImage: UIImageView!
    @IBOutlet weak var _menuTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        _profileImage.layer.cornerRadius = _profileImage.frame.height/2
        _profileImage.layer.masksToBounds = true
    }

}
