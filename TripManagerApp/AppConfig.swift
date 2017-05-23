//
//  AppConfig.swift
//  TripManagerApp
//
//  Created by Mehtab on 23/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

class AppConfig: NSObject {

    let kAccesToken:String = "access_token"
    
    static let sharedInstance = AppConfig()
    private override init() {} //This prevents others from using the default '()' initializer for this class.

    
    func saveAccesstoken(_ token: String) {
       let userDefaults = UserDefaults.standard;
        
        userDefaults.set(token, forKey: kAccesToken)
    }
    
    func getToken() -> String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: kAccesToken)
    }
}
