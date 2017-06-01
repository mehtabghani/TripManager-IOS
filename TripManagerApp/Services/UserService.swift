//
//  UserService.swift
//  TripManagerApp
//
//  Created by Mehtab on 01/06/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

class UserService: BaseService {

    private let routeLogin: String = "user"
    
    
    func getUser(userID: String, completionBlock: @escaping completionBlock) {
        let url = routeLogin.appending("/\(userID)")
        httpRequestManager?.getRequest(url: getURL(route: url), completionBlock: completionBlock)
    }
    
 
    
}
