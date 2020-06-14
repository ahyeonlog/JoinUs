//
//  RegisterViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/13.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import SnapKit
import FirebaseAuth

extension RegisterViewController {
    
    func backgroundViewConstraints() {
        view.addSubview(backgroundView)
        backgroundView.backgroundColor = .white
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            
        }
    }
    
    func registerLabelConstraints() {
        view.addSubview(registerLabel)
        registerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(80)
            make.leading.equalTo(40)
            make.size.equalTo(CGSize(width: 150.0, height: 70.0))
        }
        
    }
    
    func idLabelConstraints() {
        view.addSubview(idLabel)
        idLabel.snp.makeConstraints { (make) in
            make.top.equalTo(registerLabel.snp.top).offset(70)
            make.leading.equalTo(registerLabel.snp.leading).offset(10)
        }
    }
    
    func idTextFieldConstraints() {
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints { (make) in
            make.top.equalTo(idLabel.snp.top).offset(15)
            make.leading.equalTo(registerLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 50.0))
            
        }
    }
    
    func pwLabelConstraints() {
        view.addSubview(pwLabel)
        pwLabel.snp.makeConstraints { (make) in
            make.top.equalTo(idTextField.snp.top).offset(80)
            make.leading.equalTo(registerLabel.snp.leading).offset(10)
        }
    }
    
    func pwTextFieldConstraints() {
        view.addSubview(pwTextField)
        pwTextField.snp.makeConstraints { (make) in
            make.top.equalTo(pwLabel.snp.top).offset(15)
            make.leading.equalTo(registerLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height:50.0))
        }
    }
    
    func nextButtonConstraints() {
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(pwTextField.snp.top).offset(80)
            make.leading.equalTo(pwTextField.snp.leading)
            make.size.equalTo(CGSize(width:300.0, height:60))
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func nextButtonTapped() {
        print(#function)
    
        // ID & PW Verification
        guard let id: String = self.idTextField.text, id.isEmpty == false, id.contains("@") else {
            self.showAlert(message: "아이디를 이메일 포맷으로 입력해주세요.\n ex: example@gmail.com")
            return
        }
        
        guard let pw: String = self.pwTextField.text, pw.isEmpty == false, pw.count >= 6 else {
            self.showAlert(message: "비밀번호는 최소 6자 이상을 입력해주세요.")
            return
        }
        
//        let nextVC = ProfileViewController()
        
        // Pass Data(ID,PW) to ProfileViewController
        let profileVC = ProfileViewController()
        profileVC.idValue = id
        profileVC.pwValue = pw
        navigationController?.pushViewController(profileVC, animated: true)
        
        
        // create new User
//        Auth.auth().createUser(withEmail: id, password: pw) { (dataResult, error) in
//            if let e = error {
//                print(e.localizedDescription)
//                self.showAlert(message: "\(e.localizedDescription)")
//            } else {
//                let profileVC = ProfileViewController()
//                profileVC.idValue = id
//                profileVC.pwValue = pw
//                self.navigationController?.pushViewController(profileVC, animated: true)
//            }
//        }
        
        
        
        // Register New user Info into Firebase
//        let usersRef = self.ref.child("users")
//
//        if let uid = Auth.auth().currentUser?.uid {
//            usersRef.child(uid).setValue(["id": id, "pw": pw])
//        }
        
        
        
        
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
