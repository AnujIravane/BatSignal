//
//  BatFaceView.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/11/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
class BatFaceView: UIView {
    
    private var eyeClosedConstraints = [NSLayoutConstraint]()
    private var eyeOpenConstraints = [NSLayoutConstraint]()
    
    private lazy var faceImageView: UIImageView = {
    let batFaceImage = UIImage(named: "batFace")
    let batFaceImageView = UIImageView(image: batFaceImage)
    //batFaceImageView.contentMode = .ScaleAspectFit
    batFaceImageView.contentMode = .ScaleAspectFit
    return batFaceImageView
    }()
    
    private lazy var eyeView: UIView = {
        let eyeView = UIView()
        eyeView.backgroundColor = .nightBatmanColor()
        //eyeView.backgroundColor = .yellowColor()
        return eyeView
    }()
    
    init() {
        super.init(frame: CGRectZero)
        setupViewHierarchy()
        setupStaticConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupEyeViewConstraints()
        //layoutIfNeeded()
    }
    
    private func setupViewHierarchy() {
        addSubview(faceImageView)
        addSubview(eyeView)
        //bringSubviewToFront(faceImageView)
    }
    
    private func setupEyeViewConstraints() {
        var constraints = [NSLayoutConstraint]()
        eyeView.transform = CGAffineTransformMakeRotation(45 * CGFloat(M_PI)/180);
        eyeClosedConstraints.append(eyeView.centerXAnchor.constraintEqualToAnchor(rightAnchor, constant: -bounds.width * 0.43))
        eyeClosedConstraints.append(eyeView.centerYAnchor.constraintEqualToAnchor(topAnchor, constant: bounds.height * 0.34))
        constraints.append(eyeView.heightAnchor.constraintEqualToConstant(bounds.height * 0.12))
        constraints.append(eyeView.widthAnchor.constraintEqualToConstant(bounds.width * 0.12))

        eyeOpenConstraints.append(eyeView.centerXAnchor.constraintEqualToAnchor(rightAnchor, constant: -bounds.width * 0.5))
        eyeOpenConstraints.append(eyeView.centerYAnchor.constraintEqualToAnchor(topAnchor, constant: bounds.height * 0.21))

        NSLayoutConstraint.useAndActivateConstraints(constraints)
        NSLayoutConstraint.useAndActivateConstraints(eyeClosedConstraints)
    }
    
    private func setupStaticConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints += faceImageView.constraintsToFillSuperView()
        //constraints.append(eyeView.topAncho
        //constraints.append(eyeView.centerXAnchor.constraintEqualToAnchor(<#T##anchor: NSLayoutAnchor!##NSLayoutAnchor!#>))
        NSLayoutConstraint.useAndActivateConstraints(constraints)
        faceImageView.setContentHuggingPriority(1000, forAxis: UILayoutConstraintAxis.Horizontal)
        faceImageView.setContentHuggingPriority(1000, forAxis: UILayoutConstraintAxis.Vertical)
    }
    
    func activateEyeOpenConstraints() {
        //layoutIfNeeded()
        NSLayoutConstraint.deactivateConstraints(eyeClosedConstraints)
        NSLayoutConstraint.useAndActivateConstraints(eyeOpenConstraints)
        UIView.animateWithDuration(1.0, delay: 7.0, options: [], animations: {
            self.layoutIfNeeded()
            }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}