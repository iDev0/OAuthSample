//
//  MemberService.swift
//  OAuth
//
//  Created by iDev0 on 2020/08/12.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import Foundation
import Moya

class MemberService {
    
    private let provider = MoyaProvider<MemberProvider>()
    
    public func register(member: Member) {
        provider.request(.register(name: member.name, email: member.email, password: member.password)) { (result) in
            switch result {
            case .success(let response):
                print(String(data: response.data, encoding: .utf8))
            case .failure(let error):
                print(error)
            }
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
    
    public func login(member: Member) {
        provider.request(.login(email: member.email, password: member.password)) { (result) in
            switch result {
            case .success(let response):
                print(String(data: response.data, encoding: .utf8))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func forgotPassword(member: Member) {
        provider.request(.forgotPassword(email: member.email)) { (result) in
            switch result {
            case .success(let response):
                print(String(data: response.data, encoding: .utf8))
            case .failure(let error):
                print(error)
            }
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
