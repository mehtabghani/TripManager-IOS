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
        let item = menuItems[indexPath.row]
        AppDelegate.getInstance().navigateToMenu(menuName: item)
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
    
    let menuItems = Constants.menu
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    //MARK: Outlet
    
    @IBOutlet weak var _profileImage: UIImageView!
    @IBOutlet weak var _lblUserName: UILabel!
    @IBOutlet weak var _menuTableView: UITableView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let centerX = self.view.center.x * CGFloat(Constants.drawer_width_factor)
        _profileImage.center.x = centerX
        _lblUserName.center.x = centerX
       
    }

    override func viewWillLayoutSubviews() {
    }
    
    override func viewDidLayoutSubviews() {
        setupUi()

    }
    
    func setupUi() {
        createGradientLayer()
        _profileImage.layer.cornerRadius = _profileImage.frame.height/2
        _profileImage.layer.masksToBounds = true
        _lblUserName.text = AppConfig.sharedInstance.getUser()?.userName?.capitalized
 
        
         _menuTableView.frame = CGRect(x: _menuTableView.frame.origin.x, y: _menuTableView.frame.origin.y, width: self.view.frame.width * CGFloat(0.80), height: _menuTableView.frame.height)
    }
    
    func setupTableView() {
      
        // Register the table view cell class and its reuse id
        _menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        _menuTableView.delegate = self
        _menuTableView.dataSource = self
    }
    
    func createGradientLayer() {
       let  gradientLayer = CAGradientLayer()
        //let bounds = UIScreen.main.bounds
        gradientLayer.frame = self.view.frame//bounds
        
        let colorTop = UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [colorTop, colorBottom]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
