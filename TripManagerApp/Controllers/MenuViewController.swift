//
//  MenuViewController.swift
//  TripManagerApp
//
//  Created by Mehtab on 30/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

extension MenuViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped on \(menuItems[indexPath.row]).")
    }
}

extension MenuViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = _menuTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.backgroundColor = nil
        cell.textLabel?.textColor = UIColor.white
        
        cell.selectionStyle = .none
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

}

class MenuViewController: BaseViewController {
    
    
    let menuItems = ["Profile","Trip History","Logout"]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    //MARK: Outlet
    
    @IBOutlet weak var _profileImage: UIImageView!
    @IBOutlet weak var _menuTableView: UITableView!
    //MARK: Constraints
  
    @IBOutlet weak var _headerTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var _tableTrailingConstraint: NSLayoutConstraint!
    

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
        createGradientLayer()
        _profileImage.layer.cornerRadius = _profileImage.frame.height/2
        _profileImage.layer.masksToBounds = true
        
        
        // Register the table view cell class and its reuse id
        _menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        _menuTableView.delegate = self
        _menuTableView.dataSource = self
    }
    
    func createGradientLayer() {
       let  gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        let colorTop = UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [colorTop, colorBottom]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }

}
