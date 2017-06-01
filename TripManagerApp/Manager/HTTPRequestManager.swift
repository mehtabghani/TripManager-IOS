//
//  HTTPRequestManager.swift
//  TripManagerApp
//
//  Created by Mehtab on 23/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit
import Alamofire

//typealias completionBlock = ( (_ response:Any?, _ error:Any?) -> () )


class HTTPRequestManager: NSObject {
    
    
    func getRequestHeaders(url: String)  -> [String: String] {
    
        var headers: HTTPHeaders = ["Accept": "application/json"]
        
        if let token = AppConfig.sharedInstance.getToken() {
            headers[KeyConstants.access_token] = token
        }
        if url.contains("/login") || url.contains("/signup")   {
            headers[KeyConstants.api_secret] = Constants.api_secret
        }
        
        return headers;
    }
    
    
    public func getRequest(url: String, completionBlock: @escaping completionBlock) {
        
        let _url =  URL(string: url)!
        let headers = getRequestHeaders(url: url)

       
        Alamofire.request(_url, method: .get, headers: headers)
            .responseJSON { response in
            print(response.request!)  // original URL request
            //print(response.response!) // HTTP URL response
            //print(response.result!)   // result of response serialization
            
            guard response.result.isSuccess else {
                print(response.result.error!)
                completionBlock(nil, response.result.error);
                return;
            }
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                completionBlock(JSON, nil)
            }
        }
    }
    
    public func postRequest(url: String, data: Dictionary<String, Any>, completionBlock: @escaping completionBlock) {
        
        let _url =  URL(string: url)!
        let headers = getRequestHeaders(url: url);
        
        Alamofire.request(_url, method: .post, parameters: data, encoding:JSONEncoding.default, headers: headers)
            .responseJSON { response in
                print(response.request!)  // original URL request
                //print(response.response!) // HTTP URL response
                //print(response.result!)   // result of response serialization
                
                guard response.result.isSuccess else {
                    print(response.result.error!)
                    completionBlock(nil, response.result.error);
                    return;
                }
                
                if let JSON = response.result.value {
                    //print("JSON: \(JSON)")
                    completionBlock(JSON as? NSDictionary, nil)
                }
        }
    }


}
