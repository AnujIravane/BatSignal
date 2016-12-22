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
    
    private let batLampLightHeight: CGFloat = 286
    private let batLampLightWidth: CGFloat = 200
    
    private var signalPostedConstraints = [NSLayoutConstraint]()
    private var signalReceivedFaceConstraints = [NSLayoutConstraint]()
    private var signalReceivedBuildingConstraints = [NSLayoutConstraint]()

    private var signalSeenConstraints = [NSLayoutConstraint]()
    private var constantConstraints = [NSLayoutConstraint]()
    private var initialBuildingConstraints = [NSLayoutConstraint]()
    private var initialFaceConstraints = [NSLayoutConstraint]()
    //private var batFaceConstraints = [NSLayoutConstraint]()
    //private var batBuildingConstraints = [NSLayoutConstraint]()
    private var batSignalConstraints = [NSLayoutConstraint]()
    
    
//    private lazy var batFaceImageView: UIImageView = {
//        let batFaceImage = UIImage(named: "batFace")
//        let batFaceImageView = UIImageView(image: batFaceImage)
//        batFaceImageView.contentMode = .ScaleAspectFit
//        return batFaceImageView
//    }()
    
    private lazy var batFaceView: BatFaceView = {
        return BatFaceView()
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
        batLampLightImageview.alpha = 0.7
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
        activateSignalPostedConstraints()
    }
    
    private func setupStaticConstraints() {
        //initialConstraints.append(batFaceImageVie)
        
        signalReceivedFaceConstraints.append(batFaceView.rightAnchor.constraintEqualToAnchor(rightAnchor))
        constantConstraints.append(batFaceView.bottomAnchor.constraintEqualToAnchor(bottomAnchor))
        constantConstraints.append(batFaceView.heightAnchor.constraintEqualToConstant(batFaceHeight))
        constantConstraints.append(batFaceView.widthAnchor.constraintEqualToConstant(batFaceWidth))
        
        constantConstraints.append(buildingsImageView.leftAnchor.constraintEqualToAnchor(leftAnchor))
        
        signalReceivedBuildingConstraints.append(buildingsImageView.bottomAnchor.constraintEqualToAnchor(bottomAnchor))
        constantConstraints.append(buildingsImageView.heightAnchor.constraintEqualToConstant(buildingsHeight))
        constantConstraints.append(buildingsImageView.widthAnchor.constraintEqualToConstant(buildingsWidth))
        constantConstraints.append(batSignalView.heightAnchor.constraintEqualToConstant(batSignalViewRadius))
        constantConstraints.append(batSignalView.widthAnchor.constraintEqualToConstant(batSignalViewRadius))
        
        //may not be constant in future
        constantConstraints.append(batLampLightImageView.leftAnchor.constraintEqualToAnchor(leftAnchor))
        constantConstraints.append(batLampLightImageView.bottomAnchor.constraintEqualToAnchor(centerYAnchor))
        constantConstraints.append((batLampLightImageView.heightAnchor.constraintEqualToConstant(batLampLightHeight)))
        constantConstraints.append(batLampLightImageView.widthAnchor.constraintEqualToConstant(batLampLightWidth))
        
        constantConstraints.append(batSignalView.centerYAnchor.constraintEqualToAnchor(batLampLightImageView.topAnchor, constant: 20))
        constantConstraints.append(batSignalView.centerXAnchor.constraintEqualToAnchor(batLampLightImageView.rightAnchor, constant: -37))
        
        initialFaceConstraints.append(batFaceView.leftAnchor.constraintEqualToAnchor(rightAnchor))
        initialBuildingConstraints.append(buildingsImageView.topAnchor.constraintEqualToAnchor(bottomAnchor))
        
        NSLayoutConstraint.useAndActivateConstraints(constantConstraints)
        NSLayoutConstraint.useAndActivateConstraints(initialFaceConstraints)
        NSLayoutConstraint.useAndActivateConstraints(initialBuildingConstraints)

    }
    
    func activateSignalPostedConstraints() {
        layoutIfNeeded()
        NSLayoutConstraint.deactivateConstraints(self.initialBuildingConstraints)
        NSLayoutConstraint.useAndActivateConstraints(self.signalReceivedBuildingConstraints)
        //layoutIfNeeded()
        UIView.animateWithDuration(3.0, animations: {
            //self.setNeedsLayout()
            //self.layoutSubviews()

            self.layoutIfNeeded()
            }, completion: { (finished: Bool) -> Void in
                if finished {
                   self.activateSignalReceivedConstraints()
                }
        })
    }
    
    func activateSignalReceivedConstraints() {
        NSLayoutConstraint.deactivateConstraints(self.initialFaceConstraints)
        NSLayoutConstraint.useAndActivateConstraints(self.signalReceivedFaceConstraints)
        UIView.animateWithDuration(3.0, delay: 3.0, options: [], animations: {
            self.layoutIfNeeded()
            }, completion:  { (finished: Bool) -> Void in
                if finished {
                    self.activateSignalSeenConstraints()
                }
        })
    }
    
    func activateSignalSeenConstraints() {
        batFaceView.activateEyeOpenConstraints()
    }
    
    private func setupViewHierarchy() {
        addSubview(buildingsImageView)
        addSubview(batSignalView)
        addSubview(batFaceView)
        addSubview(batLampLightImageView)
        bringSubviewToFront(batSignalView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
