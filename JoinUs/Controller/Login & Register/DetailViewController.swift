//
//  DetailViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/14.
//  Copyright © 2020 iosNowon. All rights reserved.
//
import UIKit

extension DetailViewController {
    
    // Constraints
    func backgroundViewConstraints() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func detailLabelConstraints() {
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(80)
            make.leading.equalTo(40)
            make.size.equalTo(CGSize(width: 150.0, height: 70.0))
        }
    }
    // 직군
    func jobLabelConstraints() {
        view.addSubview(jobLabel)
        jobLabel.snp.makeConstraints { (make) in
            make.top.equalTo(detailLabel.snp.top).offset(70)
            make.leading.equalTo(detailLabel.snp.leading).offset(10)
        }
    }
    
    func jobTextFieldConstraints() {
        view.addSubview(jobTextField)
        jobTextField.snp.makeConstraints { (make) in
            make.top.equalTo(jobLabel.snp.top).offset(15)
            make.leading.equalTo(detailLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 40.0))
        }
    }
    // 경력
    func careerLabelConstraints() {
        view.addSubview(careerLabel)
        careerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(jobTextField.snp.top).offset(55)
            make.leading.equalTo(detailLabel.snp.leading).offset(10)
        }
    }
    
    func careerTextFieldConstraints() {
        view.addSubview(careerTextField)
        careerTextField.snp.makeConstraints { (make) in
            make.top.equalTo(careerLabel.snp.top).offset(15)
            make.leading.equalTo(detailLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 40.0))
        }
    }
    
    // 스킬
    func skillLabelConstraints() {
        view.addSubview(skillLabel)
        skillLabel.snp.makeConstraints { (make) in
            make.top.equalTo(careerTextField.snp.top).offset(55)
            make.leading.equalTo(careerLabel.snp.leading)
        }
    }
    
    func skillTextFieldConstraints() {
        view.addSubview(skillTextField)
        skillTextField.snp.makeConstraints { (make) in
            make.top.equalTo(skillLabel.snp.top).offset(15)
            make.leading.equalTo(detailLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 40.0))
        }
    }
    
    // 포트폴리오 & 웹 사이트
    func referenceLabelConstraints() {
        view.addSubview(referenceLabel)
        referenceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(skillTextField.snp.top).offset(55)
            make.leading.equalTo(skillLabel.snp.leading)
        }
    }
    
    func referenceTextFieldConstraints() {
        view.addSubview(referenceTextField)
        referenceTextField.snp.makeConstraints { (make) in
            make.top.equalTo(referenceLabel.snp.top).offset(15)
            make.leading.equalTo(skillTextField.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 40.0))
        }
    }
    
    // signUp 버튼    
    func signUpButtonConstraints() {
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { (make) in
            make.top.equalTo(referenceTextField.snp.top).offset(80)
            make.leading.equalTo(detailLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 60.0))
        }
    }
    
    //MARK:- Custom Methods
    
    // 버튼 클릭시
    @objc func signUpBtnTapped() {
        print(#function)
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -50
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
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
