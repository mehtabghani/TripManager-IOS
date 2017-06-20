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
    var startLongitude: String?
    var endLattitude: String?
    var endLongitude: String?
    var startOn:Date?
    var endOn:Date?


    
    func set(input: NSDictionary?) {
        guard input != nil else {
            return;
        }
        
        userId      =   input?[KeyConstants.user_id] as? Int
        tripId      =   input?[KeyConstants.trip_id] as? Int
        startLattitude = input?["start_lattitude"] as? String
        startLongitude = input?["start_longitude"] as? String
        endLattitude = input?["end_lattitude"] as? String
        endLongitude = input?["end_longitude"] as? String

        
        if let startDate = input?["start_on"] as? String {
            startOn = Utils.getDateFromString(dateString: startDate)
        }
        
        if let endDate = input?["end_on"] as? String {
            endOn = Utils.getDateFromString(dateString: endDate)
        }
        
    }
    
    func getDictionary() -> Dictionary<String, Any> {
        var dict = [String: Any]()
        dict[KeyConstants.user_id]      = userId
        dict[KeyConstants.trip_id]      = tripId
        dict["start_lattitude"]         = startLattitude
        dict["start_longitude"]         = startLongitude
        dict["end_lattitude"]           = endLattitude
        dict["end_longitude"]           = endLongitude
        
        return dict
    }
    
    func getStartDateString () -> String {
        
        let date: String = Utils.getStringFromDate(date: startOn!)
        return date
    }
    
    func getEndDateString () -> String {
        return Utils.getStringFromDate(date: endOn!)
    }
}
