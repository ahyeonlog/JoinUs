//
//  AddPostView.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/06/16.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import SnapKit

class AddPostView: UIViewController {
    
    // Cell Count Idx
    var cellCount = 0
    
    // Create 제목 Label.
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "제목"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(rgb: Constants.colorHexValue)
        
        return label
    }()
    
    // Create 제목 TextField.
    let titleField: UITextField = {
        let field = UITextField()
        field.placeholder = " 제목"
        field.font = UIFont.boldSystemFont(ofSize: 15)
        field.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        field.layer.borderWidth = 2.0
        field.layer.cornerRadius = 8
        field.borderStyle = .roundedRect
        
        return field
    }()
    
    // Create 본문 Label.
    let contentsLabel: UILabel = {
        let label = UILabel()
        label.text = "본문"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(rgb: Constants.colorHexValue)
        
        return label
    }()
    
    // Create 본문 TextView.
    let contentsTextView: UITextView = {
        
        // Create a TextView.
        let textView = UITextView()
        
        // Set the background Color.
        textView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // Set the Font.
        textView.font = .boldSystemFont(ofSize: 15)
        
        // Set border color to Classic Blue.
        textView.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        
        // Set the thickness of the border.
        textView.layer.borderWidth = 2.0
        
        // Round the corners.
        textView.layer.cornerRadius = 8
        
        // Set left justified.
        textView.textAlignment = NSTextAlignment.left
        
        // Automatically detect links, dates, etc. and convertt them to links.
        textView.dataDetectorTypes = UIDataDetectorTypes.all
        
        // Set shadow darkness.
        textView.layer.shadowOpacity = 0.5
        
        return textView
    }()
    
    // Create cancel Button.
    let cancelBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("CANCEL", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(rgb:Constants.colorHexValue)
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(cancelBtnTapped), for: .touchUpInside)
        
        return btn
    }()
    
    // Create register Button.
    let registerBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("REGISTER", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.backgroundColor = UIColor(rgb: Constants.colorHexValue)
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(registerBtnTapped), for: .touchUpInside)
       
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Call Constraints method.
        titleLabelConstraints()
        titleFieldConstraints()
        contentsLabelConstraints()
        contentsTextViewConstraints()
        cancelBtnConstraints()
        registerBtnConstraints()
        
    }
    
    // Set 제목 textLabel Constraints.
    func titleLabelConstraints() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    // Set 제목 textField Constraints.
    func titleFieldConstraints() {
        view.addSubview(titleField)
        titleField.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel).offset(25)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-15)
            make.size.equalTo(CGSize(width: 300, height: 40))
        }
    }
    
    // Set 본문 contentsLabel Constraints.
    func contentsLabelConstraints() {
        view.addSubview(contentsLabel)
        contentsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleField).offset(60)
            make.leading.equalTo(titleField)
        }
    }
    
    // Set 본문 contentsTextView Constraints.
    func contentsTextViewConstraints() {
        view.addSubview(contentsTextView)
        contentsTextView.snp.makeConstraints { (make) in
            make.top.equalTo(contentsLabel).offset(25)
            make.leading.equalTo(titleField)
            make.trailing.equalTo(titleField)
            make.size.equalTo(CGSize(width: 300, height: 500))
        }
    }
    
    // Set cancel Button Constraints.
    func cancelBtnConstraints() {
        view.addSubview(cancelBtn)
        cancelBtn.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-50)
            make.leading.equalToSuperview().offset(35)
            make.size.equalTo(CGSize(width: 130, height: 50))
        }
    }
    
    func registerBtnConstraints() {
        view.addSubview(registerBtn)
        registerBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(cancelBtn)
            make.trailing.equalToSuperview().offset(-35)
            make.size.equalTo(CGSize(width: 130, height: 50))
        }
    }
    
    
    
}
