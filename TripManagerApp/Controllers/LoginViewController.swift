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
        showSignUpScreen()
    }
//MARK: Validation
    
    func isCredentailValid(username: String?, password: String?) -> Bool {
        
        return true;
    }
    
//MARK: Login
    
    func submitLoginRequest() {
        let service = LoginService();
   
        
        let dict: [String: String] = ["user_name": userName!, "password": password!];
        
        service.login(input: dict, completionBlock: { (response, error) in
            
            guard error == nil else {
                return;
            }
            
           self.handleSuccess(response: response)
        })
    }
    
    func handleSuccess(response: Any?) {
        print("Response: \(response!)")
        
        if let res = response as? NSDictionary {
            let userId = res["user_id"] as? String
            let accessToken = res["access_token"] as? String
            AppConfig.sharedInstance.saveAccesstoken(accessToken!)
            
            
            let user = User()
            user.userId = userId
            AppConfig.sharedInstance.saveUser(user: user)
            
        }
    }
    
    func showSignUpScreen() {
        AppDelegate.getInstance().showSignUpController()
    }
    
}
