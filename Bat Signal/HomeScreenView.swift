//
//  HomeScreenView.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/12/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
class HomeScreenView: UIView {
    
    private var lampScreenHeight: CGFloat = 150
    private var lampScreenWidth: CGFloat = 130
    
    private var lampTapRecognizer = UIGestureRecognizer()
    
    private lazy var lampOnImageView: UIImageView = {
        let lampImage = UIImage(named: "batLampOn")
        let lampImageView = UIImageView(image: lampImage)
        lampImageView.contentMode = .ScaleAspectFit
        return lampImageView
    }()
    
    private lazy var lampOffImageView: UIImageView = {
        let lampImage = UIImage(named: "batLampOff")
        let lampImageView = UIImageView(image: lampImage)
        lampImageView.contentMode = .ScaleAspectFit
        lampImageView.userInteractionEnabled = true
        return lampImageView
    }()
    
    init() {
        super.init(frame: CGRectZero)
        backgroundColor = .nightBuildingColor()
        setupViewHierarchy()
        setupStaticConstraints()
    }
    
    private func setupViewHierarchy() {
        addSubview(lampOnImageView)
        addSubview(lampOffImageView)
        lampTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapLamp(_:)))
        lampOffImageView.addGestureRecognizer(lampTapRecognizer)
    }
    
    private func setupStaticConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(lampOffImageView.heightAnchor.constraintEqualToConstant(lampScreenHeight))
        constraints.append((lampOffImageView.widthAnchor.constraintEqualToConstant(lampScreenWidth)))
        constraints.append(lampOffImageView.bottomAnchor.constraintEqualToAnchor(bottomAnchor, constant: -60))
        constraints.append(lampOffImageView.centerXAnchor.constraintEqualToAnchor(centerXAnchor))
        
        constraints.append(lampOnImageView.heightAnchor.constraintEqualToAnchor(lampOffImageView.heightAnchor))
        constraints.append(lampOnImageView.widthAnchor.constraintEqualToAnchor(lampOffImageView.widthAnchor))
        constraints.append(lampOnImageView.centerYAnchor.constraintEqualToAnchor(lampOffImageView.centerYAnchor))
        constraints.append(lampOnImageView.centerXAnchor.constraintEqualToAnchor(lampOffImageView.centerXAnchor))
        NSLayoutConstraint.useAndActivateConstraints(constraints)
    }
    
    @objc private func didTapLamp(sender: UITapGestureRecognizer) {
        lampOffImageView.hidden = true
        print("got you bro")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}