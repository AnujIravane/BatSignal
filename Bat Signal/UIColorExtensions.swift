//
//  UIColorExtensions.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/10/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func nightBuildingColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 48/255, green: 93/255, blue: 96/255, alpha: alpha)
    }
    
    class func nightSkyColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 66.0/255, green: 108.0/255, blue: 110.0/255, alpha: alpha)
    }
    
    class func nightMoonColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 129/255, green: 147/255, blue: 139/255, alpha: alpha)
    }
    
    class func nighBatmanColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 13/255, green: 37/255, blue: 47/255, alpha: alpha)
    }
    
}
