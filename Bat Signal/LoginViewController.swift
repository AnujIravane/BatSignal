//
//  LoginViewController.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/8/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0,*)
class LoginViewController: UIViewController {
    
    private lazy var loginView: LoginView = {
        let loginViewModel = LoginViewModel()
        loginViewModel.loginDelegate = self
        let loginView = LoginView(viewModel: loginViewModel)
        loginView.backgroundColor = UIColor.whiteColor()
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupStaticConstraints()
    }
    
    private func setupViewHierarchy() {
       view.addSubview(loginView)
    }
    
    private func setupStaticConstraints() {
        let constraints = loginView.constraintsToFillSuperView()
        NSLayoutConstraint.useAndActivateConstraints(constraints)
    }

}

@available(iOS 9.0, *)
extension LoginViewController: LoginDelegate {
    func loginFailure() {
        
    }
    
    func loginSuccess() {
        //let homeScreenViewController = HomeScreenViewController()
        let requestAnimationViewController = RequestAnimationViewController()
        presentViewController(requestAnimationViewController, animated: true, completion: nil)
    }
    
}
