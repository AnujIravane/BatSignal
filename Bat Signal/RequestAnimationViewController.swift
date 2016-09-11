//
//  RequestAnimationViewController.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/11/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
class RequestAnimationViewController : UIViewController {
    
    private lazy var requestAnimationView: RequestAnimationView = {
        return RequestAnimationView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupStaticConstraints()
        requestAnimationView.backgroundColor = .nightSkyColor()
    }
    
    private func setupViewHierarchy() {
        view.addSubview(requestAnimationView)
    }
    
    private func setupStaticConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints += requestAnimationView.constraintsToFillSuperView()
        NSLayoutConstraint.useAndActivateConstraints(constraints)
    }
    
}