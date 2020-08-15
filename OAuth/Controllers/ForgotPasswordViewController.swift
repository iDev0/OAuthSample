//
//  ForgotPasswordViewController.swift
//  OAuth
//
//  Created by iDev0 on 2020/08/15.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import UIKit
import SwiftyJSON

class ForgotPasswordViewController: UIViewController {

    let memberService = MemberService()
    
    @IBOutlet weak var emailTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        
        guard let email = emailTextField.text else {
            return
        }
        
        
        memberService.forgotPassword(email: email) { (result) in
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
                print(error)
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
