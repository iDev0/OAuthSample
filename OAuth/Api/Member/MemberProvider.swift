//
//  MemberProvider.swift
//  OAuth
//
//  Created by iDev0 on 2020/08/11.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import Foundation
import Moya

enum MemberProvider {
    case register(name: String, email: String, password: String)
    case activation(token: String)
    case login(email: String, password: String)
    case forgotPassword(email: String)
    case resetPassword(token: String, newPassword: String)
}


extension MemberProvider: TargetType {
    var baseURL: URL {
        return URL(string: "http://localhost:9000/api")!
    }
    
    var path: String {
        switch self {
        case .register(_, _, _):
            return "/register"
        case .activation(_):
            return "/activation"
        case .login(_, _):
            return "/login"
        case .forgotPassword(_):
            return "/forgotpassword"
        case .resetPassword(_, _):
            return "/resetpassword"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .register, .activation, .login:
            return .post
        case .forgotPassword, .resetPassword:
            return .put
        }
    }
    
    var sampleData: Data {
        switch self {
        case .register, .activation, .login, .forgotPassword, .resetPassword:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .register(let name, let email, let password):
            let parameters = ["name" : name, "email" : email, "password" : password]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.httpBody)
        case .activation(let token):
            return .requestParameters(parameters: ["token" : token], encoding: URLEncoding.httpBody)
        case .login(let email, let password):
            return .requestParameters(parameters: ["email" : email, "password" : password], encoding: URLEncoding.httpBody)
        case .forgotPassword(let email):
            return .requestParameters(parameters: ["email" : email], encoding: URLEncoding.httpBody)
        case .resetPassword(let token, let newPassword):
            return .requestParameters(parameters: ["resetPasswordLink" : token, "newPassword" : newPassword], encoding: URLEncoding.httpBody)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/x-www-form-urlencoded"]
    }
    
    
}
