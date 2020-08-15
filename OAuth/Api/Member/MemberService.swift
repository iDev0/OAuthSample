//
//  MemberService.swift
//  OAuth
//
//  Created by iDev0 on 2020/08/12.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

class MemberService {
    
    private let provider = MoyaProvider<MemberProvider>()
    
    public func register(name: String, email: String, password: String, completion: @escaping Moya.Completion) {
        provider.request(.register(name: name, email: email, password: password)) { (result) in
            completion(result)
        }
    }
    
    public func activation(member: Member) {
        provider.request(.activation(token: member.token)) { (result) in
            switch result {
                case .success(let response):
                    print(String(data: response.data, encoding: .utf8))
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    public func login(email: String, password: String, completion: @escaping Moya.Completion) {
        provider.request(.login(email: email, password: password)) { (result) in
            completion(result)
        }
    }
    
    public func forgotPassword(email: String, completion: @escaping Moya.Completion) {
        provider.request(.forgotPassword(email: email)) { (result) in
            completion(result)
        }
    }
    
    public func resetPassword(member: Member) {
        provider.request(.resetPassword(token: member.token, newPassword: member.password)) { (result) in
            switch result {
            case .success(let response):
                print(String(data: response.data, encoding: .utf8))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
