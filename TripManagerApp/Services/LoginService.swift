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
    typealias completionBlock = ( (_ response:Any?, _ error:Any?) -> () )
    

    
    func postLogin(input: NSDictionary,  sucess: completionBlock) {
    
        sucess("test", nil)
        
//        Alamofire.request("https://httpbin.org/get").responseJSON { response in
//            print(response.request!)  // original URL request
//            //print(response.response!) // HTTP URL response
//            //print(response.result!)   // result of response serialization
//            
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//        }
    }
    
    
}
