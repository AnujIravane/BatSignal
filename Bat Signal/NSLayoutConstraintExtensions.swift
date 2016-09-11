//
//  NSLayoutConstraintExtensions.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/7/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    
    public class func useAndActivateConstraints(constraints: [NSLayoutConstraint]) {
        for constraint in constraints {
            if let view = constraint.firstItem as? UIView {
                view.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        activateConstraints(constraints)
    }
    
    
}