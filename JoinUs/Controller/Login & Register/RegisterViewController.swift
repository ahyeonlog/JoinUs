//
//  RegisterViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/13.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import SnapKit
import FirebaseAuth
import FirebaseDatabase

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    
    let ref = Database.database().reference()
    var userCnt = 0                          // userInfo counting
    
    //MARK:- Properties
    
    let backgroundView: UIView = {
        let theBackgroundView = UIView()
        theBackgroundView.backgroundColor = .white
        
        return theBackgroundView
    }()
    
    let registerLabel: UILabel = {
        let theRegisterLabel = UILabel()
        theRegisterLabel.text = "Register"
        theRegisterLabel.font = UIFont.boldSystemFont(ofSize: 35)
        theRegisterLabel.textColor = UIColor(rgb: Constants.colorHexValue)
        
        return theRegisterLabel
    }()
    
    let idLabel: UILabel = {
        let theIdLabel = UILabel()
        theIdLabel.text = "ID"
        theIdLabel.font = UIFont.boldSystemFont(ofSize: 10)
        
        return theIdLabel
    }()
    
    let idTextField: UITextField = {
        let theTextField = UITextField()
        theTextField.placeholder = "   exmaple@gmail.com"
        theTextField.font = UIFont(name: "System", size: 10.0)
        theTextField.layer.borderWidth = 2.0
        theTextField.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        theTextField.borderStyle = .roundedRect
        
        return theTextField
    }()
    
    let pwLabel: UILabel = {
        let thePwLabel = UILabel()
        thePwLabel.text = "PW"
        thePwLabel.font = UIFont.boldSystemFont(ofSize: 10)
        
        return thePwLabel
    }()
    
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
    
    let nextButton: UIButton = {
        let theNextButton = UIButton()
        theNextButton.setTitle("NEXT", for: .normal)
        theNextButton.setTitleColor(UIColor.white, for: .normal)
        theNextButton.backgroundColor = UIColor(rgb: Constants.colorHexValue)
        theNextButton.layer.cornerRadius = 5
        theNextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        return theNextButton
    }()
    
    
    //MARK:- Methods
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
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
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        //        navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
    
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
        
        // create new User
        Auth.auth().createUser(withEmail: id, password: pw) { (dataResult, error) in
            if let e = error {
                print(e.localizedDescription)
                self.showAlert(message: "\(e.localizedDescription)")
            } else {
                let profileVC = ProfileViewController()
                self.navigationController?.pushViewController(profileVC, animated: true)
            }
        }
        
        userCnt += 1
        
        // Register New user Info into Firebase
        let usersRef = self.ref.child("users")
        usersRef.child(String(userCnt)).setValue(["id": id, "pw": pw])
        
        
        
        
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

extension UIViewController {
    // Alert
    func showAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title: "알림",
                                                         message: message,
                                                         preferredStyle: .alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인",
                                                    style: .default,
                                                    handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
