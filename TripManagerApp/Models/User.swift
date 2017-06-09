//
//  User.swift
//  TripManagerApp
//
//  Created by Mehtab on 31/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit


class User: NSObject {

    var userId: String?
    var userName: String?
    
    func setUser(input: NSDictionary?) {
        guard input != nil else {
            return;
        }
        
        userId      = input?[KeyConstants.user_id] as? String
        userName    = input?[KeyConstants.user_name] as? String
    }
    
    func getUser() -> Dictionary<String, Any> {
        var dict = [String: String]()
        dict[KeyConstants.user_id]      = userId
        dict[KeyConstants.user_name]    = userName

        return dict
    }
}
