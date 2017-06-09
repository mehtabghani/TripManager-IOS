//
//  TripService.swift
//  TripManagerApp
//
//  Created by Mehtab on 09/06/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

class TripService: BaseService {
    
    private let routePostTrip: String = "trip"

    
    func postTrip(input: Dictionary<String, Any>,  completionBlock: @escaping completionBlock) {
        httpRequestManager?.postRequest(url: getURL(route: routePostTrip), data: input, completionBlock: completionBlock)
    }
  
    
}
