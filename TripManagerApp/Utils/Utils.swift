//
//  Utils.swift
//  TripManagerApp
//
//  Created by Mehtab on 09/06/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit


class Utils: NSObject {
    
    static let DATE_FORMAT_Z = "yyyy-MM-dd'T'HH:mm:ss.SSSS'Z'"
    static let DATE_FORMAT = "dd/MM/yyyy"

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
    
    static func getFormattedDateString(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DATE_FORMAT_Z // This formate is input formated .
        let formateDate = dateFormatter.date(from: dateString)!
        dateFormatter.dateFormat = DATE_FORMAT // Output Formated
        return dateFormatter.string(from: formateDate)
    }
    
    static func getDateFromString(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DATE_FORMAT_Z // This formate is input formated .
        return dateFormatter.date(from: dateString)!
    }
    
    static func getStringFromDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DATE_FORMAT // This formate is input formated .
        return dateFormatter.string(from: date)
    }
    

}
