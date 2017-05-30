//
//  BaseController.swift
//  TripManagerApp
//
//  Created by Mehtab on 19/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
   // var baseService: BaseService

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 160, green: 194, blue: 235, alpha: 0.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadView(_ nibName:String) {
        
//        var topLevelObjects = NSArray()
//        
//        
//        if  Bundle.main.loadNibNamed(self.getViewName(), owner: self, options: nil) {
//            let views = (topLevelObjects as Array).filter { $0 is NSView }
//            return views[0] as! NSView
//        }
    }
    
    func getViewName() -> String {
        return "MainView";
    }
    
    func loadService() {
    
    }
    
    func showMenuButton() {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        menuButton.setBackgroundImage(UIImage(named: "menu_icon"), for: .normal)
        menuButton.addTarget(self, action: #selector(onMenuPressed), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
    }
    
    func onMenuPressed() {
        self.drawerController?.openSide(.left)
    }
    

}
