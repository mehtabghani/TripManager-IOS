//
//  BaseService.swift
//  TripManagerApp
//
//  Created by Mehtab on 22/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

typealias completionBlock = ( (_ response:Any?, _ error:Any?) -> () )


enum Service {
    case login

}

class BaseService: NSObject {
    
    
    let baseUrl = "http://172.16.0.197:3001/"
    var httpRequestManager : HTTPRequestManager?
    
    
    
    override init() {
    
        super.init()
        
        httpRequestManager = HTTPRequestManager();
    }

    func getURL(route: String) -> String {
        return baseUrl.appending(route)
    }
    

}
