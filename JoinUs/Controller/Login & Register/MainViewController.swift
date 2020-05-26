//
//  MainViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/13.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    //MARK:- property
    
    let backgroundView: UIView = {
        let theBackgroundView = UIView()
        theBackgroundView.backgroundColor = .white
        
        return theBackgroundView
    }()
    
    // ImageView
    let imageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "mainView")
        
        return theImageView
    }()
    
    // Label
    let textLabel: UILabel = {
        let theTextlabel = UILabel()
        theTextlabel.text = "JoinUs"
        theTextlabel.textColor = .white
        theTextlabel.font = .boldSystemFont(ofSize: 35)
        
        return theTextlabel
    }()
    
    // Register Button
    let registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("REGISTER", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 15)
//        btn.setTitleColor(UIColor(rgb: 0x0F4C81), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(rgb: Constants.colorHexValue)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        btn.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        return btn
    }()
    
    // LOGIN Button
    let loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("LOGIN", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        btn.setTitleColor(UIColor(rgb: Constants.colorHexValue), for: .normal)
//        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor(rgb: 0xF4c81).cgColor
        btn.addTarget(self, action: #selector(loginbuttonTapped), for: .touchUpInside)
        
        return btn
    }()
    
    
    //MARK:- Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)            // 메인뷰 네비게이션 바 숨기기

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundViewConstraints()
        imageViewConstraints()
        textlabelConstraints()
        registerButtonConstraints()
        loginButtonConstraints()
        
    }
    
    // backgroundView Constraints
    func backgroundViewConstraints() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()                                           // 상하좌우 모두 동일한 제약을 걸때는 edges를 이용한다.
        }
    }
    
    // imageView Constraints
    func imageViewConstraints() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // textLabel Constraints
    func textlabelConstraints() {
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.top.equalTo(300)
            make.leading.equalTo(140)
            make.size.equalTo(CGSize(width: 120.0, height: 50.0))
        }
    }
    
    // registerButton Constraints
    func registerButtonConstraints() {
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(-40)
            make.leading.equalTo(30)
            make.size.equalTo(CGSize(width: 145.0, height:50.0))
        }
    }
    
    // loginButton Constraints
    func loginButtonConstraints() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(registerButton.snp.bottom)
            make.trailing.equalTo(-30)
            make.size.equalTo(registerButton.snp.size)
        }
    }
    
    
    // registerbuttonTapped
    @objc func registerButtonTapped() {
        print(#function)                                                        // Debug Log
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
        
    }

    // loginbuttonTapped
    @objc func loginbuttonTapped() {
        print(#function)
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
        
}


// hexColor to UIColor
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}