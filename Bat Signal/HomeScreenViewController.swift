//
//  HomeScreenViewController.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/7/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation
import UIKit


@available(iOS 9.0, *)
class HomeScreenViewController : UIViewController {
    
    private lazy var homeScreenView: HomeScreenView = {
        let homeScreenView = HomeScreenView()
        homeScreenView.backgroundColor = UIColor.grayColor()
        return homeScreenView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupStaticConstraints()
    }
    
    private func setupViewHierarchy() {
        view.addSubview(homeScreenView)
    }
    
    private func setupStaticConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(homeScreenView.topAnchor.constraintEqualToAnchor(view.topAnchor))
        constraints.append(homeScreenView.leftAnchor.constraintEqualToAnchor(view.leftAnchor))
        constraints.append(homeScreenView.rightAnchor.constraintEqualToAnchor(view.rightAnchor))
        constraints.append(homeScreenView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor))
        NSLayoutConstraint.useAndActivateConstraints(constraints)
    }
}
