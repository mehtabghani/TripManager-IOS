//
//  UIViewExtension.swift
//  TripManagerApp
//
//  Created by Mehtab on 24/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
