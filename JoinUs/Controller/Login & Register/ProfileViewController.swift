//
//  ProfileViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/14.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth


extension ProfileViewController {
    
    //MARK:- Constraints Method
    
    // 여백 터치시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func backgroundViewConstraints() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // Profile Label Constratins
    func profileLabelConstraints() {
        view.addSubview(profileLabel)
        profileLabel.snp.makeConstraints { (make) in
            make.top.equalTo(80)
            make.leading.equalTo(40)
            make.size.equalTo(CGSize(width: 150.0, height: 70.0))
        }
    }
    
    // 이름 label & textField Contraints
    func nameLabelConstraints() {
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileLabel.snp.top).offset(70)
            make.leading.equalTo(profileLabel.snp.leading).offset(10)
        }
    }
    
    func nameFieldConstraints() {
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.top).offset(15)
            make.leading.equalTo(profileLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 40.0))
            
        }
    }
    
    // 휴대폰 label & textField Constraints
    func phoneNumLabelConstraints() {
        view.addSubview(phoneNumLabel)
        phoneNumLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameTextField.snp.top).offset(55)
            make.leading.equalTo(profileLabel.snp.leading).offset(10)
        }
    }
    
    func phoneNumFieldConstraints() {
        view.addSubview(phoneNumField)
        phoneNumField.snp.makeConstraints { (make) in
            make.top.equalTo(phoneNumLabel.snp.top).offset(15)
            make.leading.equalTo(profileLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 40.0))
            
        }
    }
    
    // 한 줄 소개 label & textField Constraints
    func introLabelConstraints() {
        view.addSubview(introLabel)
        introLabel.snp.makeConstraints { (make) in
            make.top.equalTo(phoneNumField.snp.top).offset(55)
            make.leading.equalTo(phoneNumField.snp.leading).offset(10)
        }
    }
    
    func firstOptionalLabelConstraints() {
        view.addSubview(firstOptionalLabel)
        firstOptionalLabel.snp.makeConstraints { (make) in
            make.top.equalTo(introLabel.snp.top)
            make.leading.equalTo(introLabel.snp.leading).offset(45)
        }
    }
    
    
    func introFieldConstraints() {
        view.addSubview(introField)
        introField.snp.makeConstraints { (make) in
            make.top.equalTo(introLabel.snp.top).offset(15)
            make.leading.equalTo(profileLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 40.0))
        }
    }
    
    // 직군 label & textField Constraints
    func jobLabelConstraints() {
        view.addSubview(jobLabel)
        jobLabel.snp.makeConstraints { (make) in
            make.top.equalTo(introField.snp.top).offset(55)
            make.leading.equalTo(introField.snp.leading).offset(10)
        }
    }
    
    //    func secondOptionalLabelConstraints() {
    //        view.addSubview(secondOptionalLabel)
    //        secondOptionalLabel.snp.makeConstraints { (make) in
    //            make.top.equalTo(locationLabel.snp.top)
    //            make.leading.equalTo(locationLabel.snp.leading).offset(45)
    //        }
    //    }
    
    func jobFieldConstraints() {
        view.addSubview(jobTextField)
        jobTextField.snp.makeConstraints { (make) in
            make.top.equalTo(jobLabel.snp.top).offset(15)
            make.leading.equalTo(profileLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 40.0))
        }
    }
    
    
    // 경력 label & textField Constraints
    func careerLabelConstraints() {
        view.addSubview(careerLabel)
        careerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(jobTextField.snp.top).offset(55)
            make.leading.equalTo(jobTextField.snp.leading).offset(10)
        }
    }
    
    func careerFieldConstraints() {
        view.addSubview(careerTextField)
        careerTextField.snp.makeConstraints { (make) in
            make.top.equalTo(careerLabel.snp.top).offset(15)
            make.leading.equalTo(profileLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 40.0))
        }
    }
    
    // 스킬 label & textField Constraints
    func skillLabelConstraints() {
        view.addSubview(skillLabel)
        skillLabel.snp.makeConstraints { (make) in
            make.top.equalTo(careerTextField.snp.top).offset(55)
            make.leading.equalTo(careerTextField.snp.leading).offset(10)
        }
    }
    
    func skillFieldConstraints() {
        view.addSubview(skillTextField)
        skillTextField.snp.makeConstraints { (make) in
            make.top.equalTo(skillLabel.snp.top).offset(15)
            make.leading.equalTo(profileLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 40.0))
        }
    }
    
    // 포트폴리오/웹사이트 label & textField Constratins
    func referenceLabelConstraints() {
        view.addSubview(referenceLabel)
        referenceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(skillTextField.snp.top).offset(55)
            make.leading.equalTo(skillTextField.snp.leading).offset(10)
        }
    }
    
    func referenceFieldConstraints() {
        view.addSubview(referenceTextField)
        referenceTextField.snp.makeConstraints { (make) in
            make.top.equalTo(referenceLabel.snp.top).offset(15)
            make.leading.equalTo(profileLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 40.0))
        }
    }
    
    // SIGN UP Button Constraints
    func signUpBtnConstratins() {
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { (make) in
            make.top.equalTo(referenceLabel.snp.top).offset(80)
            make.leading.equalTo(referenceTextField.snp.leading)
            make.size.equalTo(CGSize(width: 300, height:60))
        }
    }
    
    func gestureRecognizerConstraints() {
        view.addGestureRecognizer(tapGesture)
    }
    
    
    //MARK:- Custom Methods
    @objc func nextButtonTapped() {
        print(#function)
        
        // Input Validation
        guard let name: String = self.nameTextField.text, name.isEmpty == false else {
            self.showAlert(message: "이름을 입력해주세요")
            return
        }
        
        guard let phoneNum: String = self.phoneNumField.text, phoneNum.isEmpty == false else {
            self.showAlert(message: "휴대폰 번호를 입력해주세요")
            return
        }
        
        
        guard let job: String = self.jobTextField.text, job.isEmpty == false else {
            self.showAlert(message: "직군을 입력해주세요")
            return
        }
        
        guard let career: String = self.careerTextField.text, career.isEmpty == false else {
            self.showAlert(message: "경력을 입력해주세요")
            return
        }
        
        guard let skill: String = self.skillTextField.text, skill.isEmpty == false else {
            self.showAlert(message: "스킬을 입력해주세요")
            return
        }
        
        // Create new user,
        Auth.auth().createUser(withEmail: idValue, password: pwValue) { (data, error) in
            if let e = error {
                self.showAlert(message: e.localizedDescription)
            } else {
                let ref = Database.database().reference()
                let usersRef = ref.child("users")
                if let uid = Auth.auth().currentUser?.uid, let intro:String = self.introField.text, let reference: String = self.referenceTextField.text {
                    usersRef.child(uid).setValue(["id": self.idValue.lowercased() , "pw": self.pwValue, "name": name, "phoneNum": phoneNum, "intro": intro, "job": job, "career": career, "skill": skill, "reference": reference])
                }
            }
        }
        
        // pop to MainViewController
        if let nc = navigationController   {
            nc.popToRootViewController(animated: true)
            showAlert(message: "회원가입 완료")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // 키보드 팝업시 뷰 컨텐츠를 가리는 이슈 해결을 위한 함수
    @objc func keyboardWillShow(_ sender: Notification) {
        print(#function)
        self.view.frame.origin.y = -65
        
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        print(#function)
        self.view.frame.origin.y = 0
    }
    
    
    
    //     여백 터치시 키보드 내리기
    func gestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print(#function)
        self.view.endEditing(true)
        
        return true
    }
}
