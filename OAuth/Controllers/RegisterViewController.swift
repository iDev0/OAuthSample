//
//  RegisterViewController.swift
//  OAuth
//
//  Created by iDev0 on 2020/08/15.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import UIKit
import SwiftyJSON

class RegisterViewController: UIViewController {
    
    let memberSevice = MemberService()

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func register(_ sender: Any) {
        
        guard let name = nameTextField.text else {
            return
        }
        
        guard let email = emailTextField.text else {
            return
        }
        
        guard let password = passwordTextField.text else {
            return
        }
        
        memberSevice.register(name: name, email: email, password: password) { (result) in
            switch result {
            case .success(let response):

                let json = try! JSON(data: response.data)
                var message = ""
                                
                if response.statusCode == 200 {
                    message = json["message"].string!
                    
                } else {
                    message = json["errors"].string!
                }
                                
                let alert = UIAlertController(title: "등록", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .default) { (action) in
                    if response.statusCode == 200 {
                        self.dismiss(animated: true, completion: nil)
                    }                    
                }
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
                
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
