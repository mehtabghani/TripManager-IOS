//
//  Trip.swift
//  TripManagerApp
//
//  Created by Mehtab on 09/06/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

class Trip: NSObject {

    
    var userId: Int?
    var startLattitude: String?
    var endLattitude: String?
    var startLongitude: String?
    var endLongitude: String?
    var startOn:Date?
    var endOn:Date?


    
    func set(input: NSDictionary?) {
        guard input != nil else {
            return;
        }
        
//        userId      = String(describing: input?[KeyConstants.user_id])
//        userName    = input?[KeyConstants.user_name] as! String?
    }
    
    func getDictionary() -> Dictionary<String, Any> {
        var dict = [String: Any]()
        dict[KeyConstants.user_id]  = userId
        dict["start_lattitude"]     = startLattitude
        dict["start_longitude"]     = endLattitude
        dict["end_lattitude"]       = startLongitude
        dict["end_longitude"]       = endLongitude
        
        return dict
    }
}
