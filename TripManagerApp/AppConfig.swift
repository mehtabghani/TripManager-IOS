//
//  AppConfig.swift
//  TripManagerApp
//
//  Created by Mehtab on 23/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

class AppConfig: NSObject {

    
    static let sharedInstance = AppConfig()
    
    private override init() {} //This prevents others from using the default '()' initializer for this class.

 //MARK: - Token
    
    func saveAccesstoken(_ token: String) {
       let userDefaults = UserDefaults.standard;
        
        userDefaults.set(token, forKey: KeyConstants.access_token)
    }
    
    func getToken() -> String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: KeyConstants.access_token)
    }
    
//MARK: - User
   
    func saveUser(user: User) {
        do {
            let userDefaults = UserDefaults.standard;
            let jsonData = try JSONSerialization.data(withJSONObject: user.getUser(), options: [])
            userDefaults.set(jsonData, forKey: KeyConstants.user)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getUser() -> User? {
        let userDefaults = UserDefaults.standard
        let data = userDefaults.data(forKey: KeyConstants.user)
        
        guard data != nil else {
            return nil
        }
        
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary

            let user = User()
            user.setUser(input: jsonData)
            return user
            
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
