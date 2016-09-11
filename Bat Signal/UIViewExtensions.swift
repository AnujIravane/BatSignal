//
//  UIViewExtensions.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/8/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
extension UIView {
    
    public func constraintsToFillSuperViewHorizontally() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(rightAnchor.constraintEqualToAnchor(superview?.rightAnchor))
        constraints.append(leftAnchor.constraintEqualToAnchor(superview?.leftAnchor))
        return constraints
    }
    
    public func constraintsToFillSuperViewVertically() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(topAnchor.constraintEqualToAnchor(superview?.topAnchor))
        constraints.append(bottomAnchor.constraintEqualToAnchor(superview?.bottomAnchor))
        return constraints
    }
    
    public func constraintsToFillSuperView() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints += constraintsToFillSuperViewVertically()
        constraints += constraintsToFillSuperViewHorizontally()
        return constraints
    }
    
}