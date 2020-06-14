//
//  DetailView.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/06/14.
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
        
        title = ""

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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
//        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
}
