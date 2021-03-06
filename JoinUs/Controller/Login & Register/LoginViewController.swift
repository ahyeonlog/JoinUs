//
//  RegisterViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/13.
//  Copyright © 2020 iosNowon. All rights reserved.
//


import UIKit
import FirebaseAuth

extension LoginViewController {
    
    // Constraints
    func backgroundViewConstraints() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func registerLabelConstraints() {
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(80)
            make.leading.equalTo(self.view).offset(40)
            make.size.equalTo(CGSize(width: 150.0, height: 70.0))
        }
    }
    
    func idLabelConstraints() {
        view.addSubview(idLabel)
        idLabel.snp.makeConstraints { (make) in
            make.top.equalTo(loginLabel.snp.top).offset(70)
            make.leading.equalTo(loginLabel.snp.leading).offset(10)
        }
    }
    
    func idTextFieldConstraints() {
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints { (make) in
            make.top.equalTo(idLabel.snp.top).offset(15)
            make.leading.equalTo(loginLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 50.0))
            
        }
    }
    
    func pwLabelConstraints() {
        view.addSubview(pwLabel)
        pwLabel.snp.makeConstraints { (make) in
            make.top.equalTo(idTextField.snp.top).offset(80)
            make.leading.equalTo(loginLabel.snp.leading).offset(10)
        }
    }
    
    func pwTextFieldConstraints() {
        view.addSubview(pwTextField)
        pwTextField.snp.makeConstraints { (make) in
            make.top.equalTo(pwLabel.snp.top).offset(15)
            make.leading.equalTo(loginLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height:50.0))
        }
    }
    
    func nextButtonConstraints() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(pwTextField.snp.top).offset(80)
            make.leading.equalTo(pwTextField.snp.leading)
            make.size.equalTo(CGSize(width:300.0, height:60))
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 로그인 버튼 터치시 홈 화면으로 이동
    @objc func loginButtonTapped() {
        print(#function)
        
        // 입력값 검증
        guard let id: String = self.idTextField.text, id.isEmpty == false, id.contains("@") else {
            self.showAlert(message: "아이디를 이메일 포맷으로 입력해주세요.\n ex: example@gmail.com")
            return
        }
        
        guard let pw: String = self.pwTextField.text, pw.isEmpty == false, pw.count >= 6 else {
            self.showAlert(message: "비밀번호는 최소 6자 이상을 입력해주세요.")
            return
        }
        
        // Firebase/Auth
        // 기존 사용자 로그인 진행
        Auth.auth().signIn(withEmail: id, password: pw) { [weak self] authResult, error in
            
            if let e = error {
                self!.showAlert(message: e.localizedDescription)
                print(e.localizedDescription)
                
            } else {
                // RootViewController Switching (MainViewController -> tabBarController)
                let tabBar = TabBarController()
                let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
                sceneDelegate.window?.rootViewController = tabBar
                
            }
        }
        
        // Print UID
        if let uid = Auth.auth().currentUser?.uid {
            print(uid)
        }
    }
    
}
