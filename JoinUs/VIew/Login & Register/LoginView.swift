//
//  LoginView.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/06/14.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    //MARK:- Properties
    
    // BackgroundView
    let backgroundView: UIView = {
        let theBackgroundView = UIView()
        theBackgroundView.backgroundColor = .white
        
        return theBackgroundView
    }()
    
    // Login Label
    let loginLabel: UILabel = {
        let theLoginLabel = UILabel()
        theLoginLabel.text = "Login"
        theLoginLabel.font = UIFont.boldSystemFont(ofSize: 35)
        theLoginLabel.textColor = UIColor(rgb: Constants.colorHexValue)
        
        return theLoginLabel
    }()
    
    // ID Label
    let idLabel: UILabel = {
        let theIdLabel = UILabel()
        theIdLabel.text = "ID"
        theIdLabel.font = UIFont.boldSystemFont(ofSize: 10)
        
        return theIdLabel
    }()
    
    // ID TextField
    let idTextField: UITextField = {
        let theTextField = UITextField()
        theTextField.placeholder = "   exmaple@gmail.com"
        theTextField.font = UIFont(name: "System", size: 10.0)
        theTextField.layer.borderWidth = 2.0
        theTextField.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        theTextField.borderStyle = .roundedRect
        
        return theTextField
    }()
    
    // PW Label
    let pwLabel: UILabel = {
        let thePwLabel = UILabel()
        thePwLabel.text = "PW"
        thePwLabel.font = UIFont.boldSystemFont(ofSize: 10)
        
        return thePwLabel
    }()
    
    // PW TextField
    let pwTextField: UITextField = {
        let theTextField = UITextField()
        theTextField.placeholder = "   *********"
        theTextField.font = UIFont(name: "System", size: 10.0)
        theTextField.layer.borderWidth = 2.0
        theTextField.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        theTextField.borderStyle = .roundedRect
        theTextField.isSecureTextEntry = true
        
        return theTextField
    }()
    
    // Login Button
    let loginButton: UIButton = {
        let theNextButton = UIButton()
        theNextButton.setTitle("LOGIN", for: .normal)
        theNextButton.setTitleColor(UIColor.white, for: .normal)
        theNextButton.backgroundColor = UIColor(rgb: Constants.colorHexValue)
        theNextButton.layer.cornerRadius = 5
        
        theNextButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return theNextButton
    }()
    
    
    //MARK:- Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        
        
        backgroundViewConstraints()
        registerLabelConstraints()
        idLabelConstraints()
        idTextFieldConstraints()
        pwLabelConstraints()
        pwTextFieldConstraints()
        nextButtonConstraints()
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
