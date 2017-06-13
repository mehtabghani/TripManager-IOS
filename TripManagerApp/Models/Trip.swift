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
    var tripId: Int?
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
        
        userId      =   input?[KeyConstants.user_id] as? Int
        tripId      =   input?[KeyConstants.trip_id] as? Int
    }
    
    func getDictionary() -> Dictionary<String, Any> {
        var dict = [String: Any]()
        dict[KeyConstants.user_id]      = userId
        dict[KeyConstants.trip_id]      = tripId
        dict["start_lattitude"]     = startLattitude
        dict["start_longitude"]     = endLattitude
        dict["end_lattitude"]       = startLongitude
        dict["end_longitude"]       = endLongitude
        
        return dict
    }
}
