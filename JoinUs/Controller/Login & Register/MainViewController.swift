//
//  MainViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/13.
//  Copyright © 2020 iosNowon. All rights reserved.
//


import Foundation
import UIKit

extension MainViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // backgroundView Constraints
    func backgroundViewConstraints() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()                                           // 상하좌우 모두 동일한 제약을 걸때는 edges를 이용한다.
        }
    }
    
    // imageView Constraints
    func imageViewConstraints() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // textLabel Constraints
    func textlabelConstraints() {
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.top.equalTo(300)
            make.leading.equalTo(140)
            make.size.equalTo(CGSize(width: 120.0, height: 50.0))
        }
    }
    
    // registerButton Constraints
    func registerButtonConstraints() {
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(-40)
            make.leading.equalTo(30)
            make.size.equalTo(CGSize(width: 145.0, height:50.0))
        }
    }
    
    // loginButton Constraints
    func loginButtonConstraints() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(registerButton.snp.bottom)
            make.trailing.equalTo(-30)
            make.size.equalTo(registerButton.snp.size)
        }
    }
    
    
    // registerbuttonTapped
    @objc func registerButtonTapped() {
        print(#function)                                                        // Debug Log
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
        
    }
    
    // loginbuttonTapped
    @objc func loginbuttonTapped() {
        print(#function)
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
}
