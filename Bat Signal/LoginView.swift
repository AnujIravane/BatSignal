//
//  LoginView.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/8/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
class LoginView: UIView {
    
    var viewModel: LoginViewModel
    
    private lazy var usernameField: UITextField = {
        let usernameField = UITextField()
        usernameField.placeholder = "Username"
        usernameField.font = UIFont(name: "Frankling Gothic Book", size: 24)
        return usernameField
    }()
    
    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.font = UIFont(name: "Frankling Gothic Book", size: 24)
        return passwordField
    }()
    
//    private lazy var loginButtonTitleLabel: UILabel = {
//        let loginButtonTitleLabel = UILabel()
//        loginButtonTitleLabel.font =
//    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        //loginButton.titleLabel?.font = UIFont(name: "Frankling Gothic Book", size: 24)
        //loginButton.titleLabel?.backgroundColor = UIColor.whiteColor()
        loginButton.addTarget(self, action: #selector(didPressLoginButton(_:)), forControlEvents: .TouchUpInside)
        //loginButton.titleLabel?.text = "Login"
        loginButton.setTitle("ENTER THE CAVE", forState: .Normal)
        loginButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        return loginButton
    }()
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.whiteColor()
        return containerView
    }()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRectZero)
        setupViewHierarchy()
        setupStaticConstraints()
    }
    
    private func setupViewHierarchy() {
        containerView.addSubview(usernameField)
        containerView.addSubview(passwordField)
        containerView.addSubview(loginButton)
        addSubview(containerView)
    }
    
    private func setupStaticConstraints() {
        
        // Could have used a stack view ya dumb biatch
        var constraints = [NSLayoutConstraint]()
        constraints.append(containerView.centerXAnchor.constraintEqualToAnchor(centerXAnchor))
        constraints.append(containerView.centerYAnchor.constraintEqualToAnchor(centerYAnchor))
        constraints.append(containerView.widthAnchor.constraintEqualToAnchor(widthAnchor, multiplier: 0.7))
        constraints.append(containerView.heightAnchor.constraintEqualToAnchor(heightAnchor, multiplier: 0.3))
        
        constraints.append(usernameField.topAnchor.constraintEqualToAnchor(containerView.topAnchor, constant: 10))
        constraints.append(usernameField.leftAnchor.constraintEqualToAnchor(containerView.leftAnchor, constant: 10))
        constraints.append(usernameField.rightAnchor.constraintEqualToAnchor(containerView.rightAnchor, constant: 10))
        constraints.append(usernameField.heightAnchor.constraintEqualToAnchor(containerView.heightAnchor, multiplier: 0.25))
        constraints.append(passwordField.topAnchor.constraintEqualToAnchor(usernameField.bottomAnchor, constant: 10))
        constraints.append(passwordField.leftAnchor.constraintEqualToAnchor(usernameField.leftAnchor))
        constraints.append(passwordField.rightAnchor.constraintEqualToAnchor(usernameField.rightAnchor))
        constraints.append(passwordField.heightAnchor.constraintEqualToAnchor(usernameField.heightAnchor))
        
        constraints.append(loginButton.topAnchor.constraintEqualToAnchor(passwordField.bottomAnchor, constant: 10))
        constraints.append(loginButton.centerXAnchor.constraintEqualToAnchor(containerView.centerXAnchor))
        constraints.append(loginButton.widthAnchor.constraintEqualToAnchor(containerView.widthAnchor, multiplier: 0.6))
        constraints.append(loginButton.heightAnchor.constraintEqualToAnchor(usernameField.heightAnchor))
        
        NSLayoutConstraint.useAndActivateConstraints(constraints)
    }
    
    @objc private func didPressLoginButton(sender: UIButton) {
        if let username = usernameField.text {
            if let password = passwordField.text {
                viewModel.username = username
                viewModel.password = password
                viewModel.login()
            }
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
    
    
}