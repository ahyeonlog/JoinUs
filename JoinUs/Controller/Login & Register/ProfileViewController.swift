//
//  ProfileViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/14.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    //MARK:- Properties
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    let profileLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "Profile"
        theLabel.font = UIFont.boldSystemFont(ofSize: 35)
        theLabel.textColor = UIColor(rgb: Constants.colorHexValue)
        
        return theLabel
    }()
    
    let nameLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "이름"
        theLabel.font = UIFont.boldSystemFont(ofSize: 10)
        
        return theLabel
    }()
    
    let nameTextField: UITextField = {
        let theField = UITextField()
        theField.font = UIFont(name: "System", size: 8.0)
        theField.layer.borderWidth = 2.0
        theField.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        theField.borderStyle = .roundedRect
        
        return theField
    }()
    
    let phoneNumLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "휴대폰"
        theLabel.font = UIFont.boldSystemFont(ofSize: 10)
        
        return theLabel
    }()
    
    let phoneNumField: UITextField = {
        let theField = UITextField()
        theField.font = UIFont(name: "System", size: 8.0)
        theField.layer.borderWidth = 2.0
        theField.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        theField.borderStyle = .roundedRect
        
        return theField
    }()
    
    // 한 줄 소개
    let introLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "한 줄 소개"
        theLabel.font = UIFont.boldSystemFont(ofSize: 10)
        
        return theLabel
    }()
    
    let firstOptionalLabel: UILabel = {
        let thelabel = UILabel()
        thelabel.text = "(optional)"
        thelabel.font = UIFont.boldSystemFont(ofSize: 8)
        thelabel.textColor = UIColor(white: 0.5, alpha: 0.5)
        
        return thelabel
    }()
    
    let secondOptionalLabel: UILabel = {
        let thelabel = UILabel()
        thelabel.text = "(optional)"
        thelabel.font = UIFont.boldSystemFont(ofSize: 8)
        thelabel.textColor = UIColor(white: 0.5, alpha: 0.5)
        
        return thelabel
    }()
    
    let introField: UITextField = {
        let theField = UITextField()
        theField.font = UIFont(name: "System", size: 10.0)
        theField.layer.borderWidth = 2.0
        theField.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        theField.borderStyle = .roundedRect
        
        return theField
    }()
    
    let locationLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "활동 지역"
        theLabel.font = UIFont.boldSystemFont(ofSize: 10)
        
        return theLabel
    }()
    
    let locationField: UITextField = {
        let theField = UITextField()
        theField.font = UIFont(name: "System", size: 10.0)
        theField.layer.borderWidth = 2.0
        theField.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        theField.borderStyle = .roundedRect
        
        return theField
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundViewConstraints()
        profileLabelConstraints()
        nameLabelConstraints()
        nameFieldConstraints()
        phoneNumLabelConstraints()
        phoneNumFieldConstraints()
        introLabelConstraints()
        firstOptionalLabelConstraints()
//        secondOptionalLabelConstraints()
        introFieldConstraints()
        locationLabelConstraints()
        locationFieldConstraints()
        nextButtonConstratins()
        
//        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    //MARK:- Constraints Method
    func backgroundViewConstraints() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
//            make.top.leading.trailing.bottom.equalTo(self.view)
            make.edges.equalToSuperview()
        }
        
    }
    
    func profileLabelConstraints() {
        view.addSubview(profileLabel)
        profileLabel.snp.makeConstraints { (make) in
            make.top.equalTo(80)
            make.leading.equalTo(40)
            make.size.equalTo(CGSize(width: 150.0, height: 70.0))
        }
    }
    
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
    
    func locationLabelConstraints() {
        view.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { (make) in
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
    
    
    func locationFieldConstraints() {
        view.addSubview(locationField)
        locationField.snp.makeConstraints { (make) in
            make.top.equalTo(locationLabel.snp.top).offset(15)
            make.leading.equalTo(profileLabel.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height: 40.0))
        }
    }
    
    func nextButtonConstratins() {
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(locationField.snp.top).offset(80)
            make.leading.equalTo(locationField.snp.leading)
            make.size.equalTo(CGSize(width: 300.0, height:60))
        }
    }
    
    //MARK:- Custom Methods
    @objc func nextButtonTapped() {
        print(#function)
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
