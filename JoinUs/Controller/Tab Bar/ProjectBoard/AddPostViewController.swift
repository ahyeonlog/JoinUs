//
//  AddPostViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/06/16.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

extension AddPostView {
    
    // cancel 버튼 터치시
    @objc func cancelBtnTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // register 버튼 터치시
    @objc func registerBtnTapped() {
        
        // 입력값이 정상적이지 않은 경우
        guard let title = titleField.text, title.isEmpty == false, let contents = contentsTextView.text, contents.isEmpty == false else {
            alertFilltext()
            return
        }
        
        // 입력값이 정상인 경우
        saveProjectPost(title: title, content: contents)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func saveProjectPost(title: String, content: String) {
        // 시간 저장 포맷 정의
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentTime = formatter.string(from: Date())
        
        // 데이터베이스 참조 변수 선언
        let ref = Database.database().reference()
        
        // ProjectPosts.childByAutoId에 데이터 저장
        if let uid = Auth.auth().currentUser?.uid {
            ref.child("ProjectPosts").childByAutoId().setValue(["author" : uid, "title": title, "contents": content, "createTime": currentTime, "like_count": 0, "comment_count": 0 ])
        }

    }
    
    func alertFilltext() {
        let alert = UIAlertController(title: "제목과 본문을 입력하세요.", message: nil, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
