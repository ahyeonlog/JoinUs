//
//  MainView.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/06/14.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    //MARK:- property
    
    // BackgroundView
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
        title = ""
        
        backgroundViewConstraints()
        imageViewConstraints()
        textlabelConstraints()
        registerButtonConstraints()
        loginButtonConstraints()
        
    }
}


/*  ========================================== Extension ==========================================  */


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
