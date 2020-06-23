//
//  AddGeneralPostView.swift
//  JoinUs
//
//  Created by Seok on 23/06/2020.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import SnapKit

class AddGeneralPostView: UIViewController {
    
    let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "제목"
        tf.font = UIFont.boldSystemFont(ofSize: 15)
        tf.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        tf.layer.borderWidth = 2.0
        tf.layer.cornerRadius = 8
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let contentTextView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = UIColor.white
        tv.font = UIFont.boldSystemFont(ofSize: 15)
        tv.layer.borderColor = UIColor(rgb: Constants.colorHexValue).cgColor
        tv.layer.borderWidth = 2.0
        tv.layer.cornerRadius = 8
        tv.textAlignment = NSTextAlignment.left
        tv.layer.shadowOpacity = 0.5
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextFieldConstraints()
        contentTextViewConstraints()
        
        self.tabBarController?.tabBar.isHidden = true
        
        self.view.backgroundColor = .white
        navigationItem.title = "글 쓰기"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(tappedCancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(tappedDoneButton))
        
        

        // Do any additional setup after loading the view.
    }
    
    func titleTextFieldConstraints() {
        self.view.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.size.equalTo(CGSize(width: 300, height: 40))
        }
    }
    
    func contentTextViewConstraints() {
        self.view.addSubview(contentTextView)
        contentTextView.snp.makeConstraints { (make) in
            make.top.equalTo(titleTextField).offset(60)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.size.equalTo(CGSize(width: 300, height: 400))
        }
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
