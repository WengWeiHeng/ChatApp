//
//  LoginviewModel.swift
//  ChatApp
//
//  Created by Heng on 2020/6/28.
//  Copyright © 2020 Heng. All rights reserved.
//

import Foundation

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}
