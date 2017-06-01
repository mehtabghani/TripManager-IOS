//
//  LoginService.swift
//  TripManagerApp
//
//  Created by Mehtab on 22/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit
import Alamofire


class LoginService: BaseService {
    
    private let routeLogin: String = "login"
    private let routeSignup: String = "signup"

    
    func login(input: Dictionary<String, Any>,  completionBlock: @escaping completionBlock) {
    
        httpRequestManager?.postRequest(url: getURL(route: routeLogin), data: input, completionBlock: completionBlock)
    }
    
    func signup(input: Dictionary<String, Any>,  completionBlock: @escaping completionBlock) {
    
    }
    
    
}
