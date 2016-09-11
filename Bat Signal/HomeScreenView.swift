//
//  HomeScreenView.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/7/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
class HomeScreenView : UIView {
    
    private let logoHeight: CGFloat = 100.0
    
    private lazy var mainLogoView: UIImageView = {
        let mainLogoImage = UIImage(named: "mainLogo")
        let mainLogoView = UIImageView(image: mainLogoImage)
        mainLogoView.alpha = 0.9
        mainLogoView.backgroundColor = UIColor.clearColor()
        return mainLogoView
    }()
    
    private lazy var leftLampImageView: UIImageView = {
        let leftLampImage = UIImage(named: "batLampLeft")
        let leftLampImageView = UIImageView(image: leftLampImage)
        leftLampImageView.alpha = 0.9
        return leftLampImageView
    }()

    private lazy var rightLampImageView: UIImageView = {
        let rightLampImage = UIImage(named: "batLampRight")
        let rightLampImageView = UIImageView(image: rightLampImage)
        rightLampImageView.alpha = 0.9
        return rightLampImageView
    }()
    
    
    init() {
        super.init(frame: CGRectZero)
        setupViewHierarchy()
        setStaticConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addSubview(mainLogoView)
        addSubview(leftLampImageView)
        addSubview(rightLampImageView)
    }
    
    private func setStaticConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(mainLogoView.topAnchor.constraintEqualToAnchor(topAnchor, constant: 120))
        constraints.append(mainLogoView.leftAnchor.constraintEqualToAnchor(leftAnchor, constant: 20))
        constraints.append(mainLogoView.rightAnchor.constraintEqualToAnchor(rightAnchor, constant: -20))
        constraints.append(mainLogoView.heightAnchor.constraintEqualToConstant(logoHeight))
        constraints += lampImageViewConstraints()
        
        NSLayoutConstraint.useAndActivateConstraints(constraints)
    }
    
    private func lampImageViewConstraints() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(leftLampImageView.leftAnchor.constraintEqualToAnchor(leftAnchor, constant: 10))
        constraints.append(leftLampImageView.bottomAnchor.constraintEqualToAnchor(mainLogoView.bottomAnchor, constant: 300))
        constraints.append(leftLampImageView.heightAnchor.constraintEqualToConstant(60))
        constraints.append(leftLampImageView.widthAnchor.constraintEqualToConstant(35))
        
        constraints.append(rightLampImageView.rightAnchor.constraintEqualToAnchor(rightAnchor, constant: -10))
        constraints.append(rightLampImageView.bottomAnchor.constraintEqualToAnchor(mainLogoView.bottomAnchor, constant: 300))
        constraints.append(rightLampImageView.heightAnchor.constraintEqualToConstant(60))
        constraints.append(rightLampImageView.widthAnchor.constraintEqualToConstant(35))
        
        return constraints
    }
}