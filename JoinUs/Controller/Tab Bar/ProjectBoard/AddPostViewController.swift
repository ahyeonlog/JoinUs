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
    
    /*
     프로젝트 셀
     - 게시글 타이틀 : 제목을 입력해 주세요
     - 게시글 본문내용
     - 작성자 닉네임
     - 작성 시간
     - 댓글 개수
     - 좋아요 개수
     */
    
    // cancel 버튼 터치시
    @objc func cancelBtnTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // register 버튼 터치시
    @objc func registerBtnTapped() {
        cellCount += 1
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentTime = formatter.string(from: Date())
        
        let ref = Database.database().reference()
        
        let projectCellRef = ref.child("projectcell")
        let userRef = ref.child("users")
        if let title = self.titleField.text, let contents = self.contentsTextView.text, let uid = Auth.auth().currentUser?.uid {
            
            userRef.child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                let author = value?["name"]
                
                projectCellRef.child(String(self.cellCount)).setValue(["author": author, "title": title, "contents": contents, "written_time": currentTime, "like_count": "0", "comment_count": "0"])
            })
            
//            showAlert(message: "정상적으로 글이 등록되었습니다.")
            print("cellCount = \(cellCount)")
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
}
