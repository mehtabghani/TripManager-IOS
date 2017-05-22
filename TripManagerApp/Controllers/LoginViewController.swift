//
//  LoginViewController.swift
//  TripManagerApp
//
//  Created by Mehtab on 22/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController  {
    
    var userName: String?
    var password: String?
    
    @IBOutlet weak var _userNameField: CustomTextField!
    @IBOutlet weak var _passwordField: CustomTextField!
    
    @IBOutlet weak var _btnLogin: UIButton!
    @IBOutlet weak var _btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // _userNameField.becomeFirstResponder();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
  
//MARK: Button Events

    @IBAction func onLogin(_ sender: Any) {
        userName = _userNameField.text;
        password = _passwordField.text;
        
        if isCredentailValid(username: userName, password: password) {
        
            submitLoginRequest()
        }
        
    }

    @IBAction func onSignup(_ sender: Any) {
        
    }
//MARK: Validation
    
    func isCredentailValid(username: String?, password: String?) -> Bool {
        
        return true;
    }
    
//MARK: Login
    
    func submitLoginRequest() {
        let service = LoginService();
        
        let dict:NSDictionary = ["user_name": userName!, "password": password!]
        
        service.postLogin(input: dict, sucess: { (response, error) in
            
            if let err = error {
                print(err)
                return;
            }
            
            print(response!)
        })
    }
    
}
