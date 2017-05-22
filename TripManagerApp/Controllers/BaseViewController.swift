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

}
