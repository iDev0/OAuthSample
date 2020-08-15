//
//  LoginViewController.swift
//  OAuth
//
//  Created by iDev0 on 2020/08/15.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginViewController: UIViewController {
    
    let memberService = MemberService()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        
        guard let email = emailTextField.text else {
            return
        }
        
        guard let password = passwordTextField.text else {
            return
        }
        
        
        memberService.login(email: email, password: password) { (result) in
            switch result {
            case .success(let response):
                
                let json = try! JSON(data: response.data)
                                    
                if response.statusCode == 200 {
                    print(json)
                } else {
                    print(json["errors"].string!)
                }
                
                break
            case .failure(let error):
                break
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
