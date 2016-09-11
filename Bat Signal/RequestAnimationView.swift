//
//  RequestAnimationView.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/11/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
class RequestAnimationView: UIView {
    
    private let batFaceHeight: CGFloat = 530
    private let batFaceWidth: CGFloat = 300
    private let buildingsHeight: CGFloat = 334
    private let buildingsWidth: CGFloat = 414
    private let batSignalViewRadius: CGFloat = 100
    
    private lazy var batFaceImageView: UIImageView = {
        let batFaceImage = UIImage(named: "batFace")
        let batFaceImageView = UIImageView(image: batFaceImage)
        batFaceImageView.contentMode = .ScaleAspectFit
        return batFaceImageView
    }()
    
    private lazy var buildingsImageView: UIImageView = {
        let buildingsImage = UIImage(named: "batBuildings")
        let buildingsImageView = UIImageView(image: buildingsImage)
        buildingsImageView.contentMode = .ScaleAspectFit
        //buildingsImageView.setContentHuggingPriority(UILayoutPriorityDefaultHigh, forAxis: UILayoutConstraintAxis.Horizontal)
        //buildingsImageView.setContentHuggingPriority(UILayoutPriorityDefaultHigh, forAxis: UILayoutConstraintAxis.Vertical)

        return buildingsImageView
    }()
    
    private lazy var batSignalView: UIImageView = {
        let batSignalImage = UIImage(named: "mainLogo")
        let batSignalView = UIImageView(image: batSignalImage)
        batSignalView.backgroundColor = .nightMoonColor()
        batSignalView.contentMode = .ScaleAspectFit
        return batSignalView
    }()
    
    private lazy var batLampLightImageView: UIImageView = {
        let batLampLightImage = UIImage(named: "batLampLight")
        let batLampLightImageview: UIImageView = UIImageView(image: batLampLightImage)
        return batLampLightImageview
    }()
    
    init() {
        super.init(frame: CGRectZero)
        setupViewHierarchy()
        setupStaticConstraints()
        //backgroundColor = .nightSkyColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        batSignalView.layer.cornerRadius = batSignalView.frame.width / 2
    }
    
    private func setupStaticConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(batFaceImageView.rightAnchor.constraintEqualToAnchor(rightAnchor))
        constraints.append(batFaceImageView.bottomAnchor.constraintEqualToAnchor(bottomAnchor))
        constraints.append(batFaceImageView.heightAnchor.constraintEqualToConstant(batFaceHeight))
        constraints.append(batFaceImageView.widthAnchor.constraintEqualToConstant(batFaceWidth))
        
        constraints.append(buildingsImageView.leftAnchor.constraintEqualToAnchor(leftAnchor))
        
        constraints.append(buildingsImageView.bottomAnchor.constraintEqualToAnchor(bottomAnchor))
        constraints.append(buildingsImageView.heightAnchor.constraintEqualToConstant(buildingsHeight))
        constraints.append(buildingsImageView.widthAnchor.constraintEqualToConstant(buildingsWidth))
        constraints.append(batSignalView.topAnchor.constraintEqualToAnchor(topAnchor, constant: 40))
        constraints.append(batSignalView.leftAnchor.constraintEqualToAnchor(leftAnchor, constant: 40))
        constraints.append(batSignalView.heightAnchor.constraintEqualToConstant(batSignalViewRadius))
        constraints.append(batSignalView.widthAnchor.constraintEqualToConstant(batSignalViewRadius))
        
        NSLayoutConstraint.useAndActivateConstraints(constraints)
        
    }
    
    private func setupViewHierarchy() {
        addSubview(buildingsImageView)
        addSubview(batSignalView)
        addSubview(batFaceImageView)
        addSubview(<#T##view: UIView##UIView#>)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}