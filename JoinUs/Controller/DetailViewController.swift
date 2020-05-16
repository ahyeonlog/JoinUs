//
//  DetailViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/14.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    //MARK:- Properties
    
    let backgroundView: UIView = {
        let theView = UIView()
        theView.backgroundColor = .white
        
        return theView
    }()
    
    // 디테일 label
    let detailLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "Detail"
        theLabel.textColor = UIColor(rgb: Constants.colorHexValue)
        theLabel.font = .boldSystemFont(ofSize: 35)
        
        return theLabel
    }()
    
    // 직군 label & textField
    let jobLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "직군"
        theLabel.font = .boldSystemFont(ofSize: 10)

        return theLabel
    }()
    
    let jobTextField: UITextField = {
        let theTextField = UITextField()
        theTextField.font = UIFont(name: "system", size: 10.0)
        theTextField.layer.borderWidth = 2.0
        theTextField.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        
        return theTextField
    }()
    
    // 경력 label & textField
    let careerLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "경력"
        theLabel.font = .boldSystemFont(ofSize: 10)

        return theLabel
    }()
    
    let careerTextField: UITextField = {
        let theTextField = UITextField()
        theTextField.font = UIFont(name: "system", size: 10.0)
        theTextField.layer.borderWidth = 2.0
        theTextField.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        
        return theTextField
    }()
    
    // 스킬 label & textField
    let skillLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "스킬"
        theLabel.font = .boldSystemFont(ofSize: 10)
        
        return theLabel
    }()
    
    let skillTextField: UITextField = {
        let theTextField = UITextField()
        theTextField.font = UIFont(name: "system", size: 10.0)
        theTextField.layer.borderWidth = 2.0
        theTextField.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        
        return theTextField
    }()
    
    // 포트폴리오 / 웹사이트 label & textField
    let referenceLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "PortFolio / Website"
        theLabel.font = .boldSystemFont(ofSize: 10)
        
        return theLabel
    }()
    
    let referenceTextField: UITextField = {
        let theTextField = UITextField()
        theTextField.font = UIFont(name: "system", size: 10.0)
        theTextField.layer.borderWidth = 2.0
        theTextField.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        
        return theTextField
    }()
    
    let signUpButton: UIButton = {
        let theButton = UIButton()
        theButton.setTitle("SIGN UP", for: .normal)
        theButton.setTitleColor(UIColor.white, for: .normal)
        theButton.backgroundColor = UIColor(rgb: Constants.colorHexValue)
        theButton.layer.cornerRadius = 5
        theButton.addTarget(self, action: #selector(signUpBtnTapped), for: .touchUpInside)
        
        return theButton
    }()

    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundViewConstraints()
        detailLabelConstraints()
        jobLabelConstraints()
        jobTextFieldConstraints()
        careerLabelConstraints()
        careerTextFieldConstraints()
        skillLabelConstraints()
        skillTextFieldConstraints()
        referenceLabelConstraints()
        referenceTextFieldConstraints()
        signUpButtonConstraints()
    }
    
    // Constraints
    func backgroundViewConstraints() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
