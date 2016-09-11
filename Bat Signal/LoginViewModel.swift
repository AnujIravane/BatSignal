//
//  LoginViewModel.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/8/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation

protocol LoginDelegate {
    func loginSuccess()
    func loginFailure()
}

class LoginViewModel {

    var loginDelegate: LoginDelegate?
    
    var username: String = ""
    
    var password: String = ""
    
    func login() {
        BatAPI().login(username, password: password, loginCompletionHandler: didReceiveLoginResponse(_:))
    }
    
    func didReceiveLoginResponse(success: Bool) -> Void {
        if success {
            loginDelegate?.loginSuccess()
        } else {
            loginDelegate?.loginFailure()
        }
    }
}
