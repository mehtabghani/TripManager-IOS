//
//  SignUpViewController.swift
//  TripManagerApp
//
//  Created by Mehtab on 23/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController {
    
    
    
    
    @IBOutlet weak var _userNameField: CustomTextField!
    @IBOutlet weak var _passwordField: CustomTextField!
    @IBOutlet weak var _confirmPasswordField: CustomTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func showLoginScreen() {
        AppDelegate.getInstance().showLoginController()
    }

    @IBAction func onLogin(_ sender: Any) {
        showLoginScreen();
    }
    @IBAction func onSingUp(_ sender: Any) {
        
    }
}
