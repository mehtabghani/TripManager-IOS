//
//  Utils.swift
//  TripManagerApp
//
//  Created by Mehtab on 09/06/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

class Utils: NSObject {

    static func getDictionaryFromPlist( plistName:String) -> Dictionary<String, String>? {
        if let url = Bundle.main.url(forResource:plistName, withExtension: "plist") {
            do {
                var dict:Dictionary<String, String>?
                let data = try Data(contentsOf:url)
                dict = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String:String]
                return dict!
            } catch {
                print(error)
            }
        }
        
        return nil
    }
}
