import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

extension AddGeneralPostView {
    @objc func tappedCancelButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tappedDoneButton() {
        guard let title = titleTextField.text, title.isEmpty == false, let content = contentTextView.text, content.isEmpty == false else {
            alertFillTitleAndContent()
            return
        }
        
        saveGeneralPost(title: title, content: content)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func saveGeneralPost(title: String, content: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd-HH-mm"
        let currentTime = formatter.string(from: Date())
        
        let ref = Database.database().reference()
        
        if let uid = Auth.auth().currentUser?.uid {
            ref.child("GeneralPosts").childByAutoId().setValue(["author" : uid, "title" : title, "content" : content, "createTime" : currentTime, "like_count" : 0, "comment_count" : 0])
        }
        
    }
    
    func alertFillTitleAndContent() {
        let alert = UIAlertController(title: "제목과 본문을 입력하세요", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}
