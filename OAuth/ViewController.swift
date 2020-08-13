//
//  ViewController.swift
//  OAuth
//
//  Created by iDev0 on 2020/08/09.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {

    let memberService = MemberService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var member = Member(name: "jung", email: "insert@kakao.com", password: "123456", token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoianVuZyIsImVtYWlsIjoiaW5zZXJ0QGtha2FvLmNvbSIsInBhc3N3b3JkIjoiMTIzNDU2IiwiaWF0IjoxNTk3MjkzODM4LCJleHAiOjE1OTcyOTUwMzh9.uOCxnP93SpmhqaHPb3mOv_5eEdHd3rSGrUx4Efn2spg")
        
        // memberService.register(member: member)
        
        // memberService.activation(member: member)
        
        // memberService.login(member: member)
        
        // memberService.forgotPassword(member: member)
                
        member.token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZjM0YzU1Y2YzYzIyMDE1OTRiNzA4ZjIiLCJpYXQiOjE1OTcyOTQxNjYsImV4cCI6MTU5NzI5NTk2Nn0.ucBw9e4ufAR_DlxVZ3kMjWVLP7RrIakV_98kA9Qcg7U"
        
        memberService.resetPassword(member: member)
        
        
    }


}

