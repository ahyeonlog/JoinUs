//
//  ProfileView.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/06/14.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    //MARK:- Properties

    var idValue: String = ""
    var pwValue: String = ""
    
    // Background View
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    // Profile Label
    let profileLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "Profile"
        theLabel.font = UIFont.boldSystemFont(ofSize: 35)
        theLabel.textColor = UIColor(rgb: Constants.colorHexValue)
        
        return theLabel
    }()
    
    
    // 이름 label & textField
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
        theField.addTarget(self, action: #selector(keyboardWillShow), for: .touchUpInside)
        
        return theField
    }()
    
    // 휴대폰 label & textField
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
        theField.keyboardType = .decimalPad
        
        return theField
    }()
    
    // 한 줄 소개 label & textField
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
    
    //    let secondOptionalLabel: UILabel = {
    //        let thelabel = UILabel()
    //        thelabel.text = "(optional)"
    //        thelabel.font = UIFont.boldSystemFont(ofSize: 8)
    //        thelabel.textColor = UIColor(white: 0.5, alpha: 0.5)
    //
    //        return thelabel
    //    }()
    
    let introField: UITextField = {
        let theField = UITextField()
        theField.font = UIFont(name: "System", size: 10.0)
        theField.layer.borderWidth = 2.0
        theField.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        theField.borderStyle = .roundedRect
        
        return theField
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
        theTextField.borderStyle = .roundedRect
        
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
        theTextField.keyboardType = .decimalPad
        theTextField.borderStyle = .roundedRect
        
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
        theTextField.borderStyle = .roundedRect
        
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
        theTextField.borderStyle = .roundedRect
        
        return theTextField
    }()
    
    
    
    // SIGN UP button Button
    let signUpButton: UIButton = {
        let theNextButton = UIButton()
        theNextButton.setTitle("SIGN UP", for: .normal)
        theNextButton.setTitleColor(UIColor.white, for: .normal)
        theNextButton.backgroundColor = UIColor(rgb: Constants.colorHexValue)
        theNextButton.layer.cornerRadius = 5
        theNextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        return theNextButton
    }()
    
    // tapGesture Recognizer
    var tapGesture: UITapGestureRecognizer {
        let theTapGesture = UITapGestureRecognizer()
        self.view.addGestureRecognizer(theTapGesture)
        
        return theTapGesture
    }
    
    
    //MARK:- Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = ""
        tapGesture.delegate = self
        
        // Add Observer
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
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
        
        jobLabelConstraints()
        jobFieldConstraints()
        
        careerLabelConstraints()
        careerFieldConstraints()
        
        skillLabelConstraints()
        skillFieldConstraints()
        
        referenceLabelConstraints()
        referenceFieldConstraints()
        
        signUpBtnConstratins()
        
        
    }
    
}
