//
//  LoginViewController.swift
//  poc
//
//  Created by Salaheddine on 18/04/2020.
//  Copyright © 2020 Salaheddine. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    weak var coordinator: LoginCoordinator?
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordText.isSecureTextEntry = true
    }
    @IBAction func connexionAction(_ sender: Any) {
        coordinator?.loginStart(email: emailText.text, password: passwordText.text)
        
    }
    override func viewWillAppear(_ animated: Bool) {

    }
    
}
