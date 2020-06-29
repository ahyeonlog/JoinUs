//
//  NewChatRoomViewController.swift
//  JoinUs
//
//  Created by Ahyeon Gil on 2020/06/24.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import Firebase

extension NewChatRoomView {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegate & dataSource
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //set UI
        setUpView()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(tapCancelButton))
        
 
        //서치바에 자동으로 커서 옮기기
        searchBar.becomeFirstResponder()
        
    }

    
    @objc func tapCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension NewChatRoomView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let text = searchBar.text else {
//            return
//        }
        
        FirebaseManager.shared.ref.child("users").observeSingleEvent(of: .value) { (snapshot) in

            for item in snapshot.children.allObjects as! [DataSnapshot] {
                let value = item.value as? NSDictionary
                let userName = value?["name"] as? String ?? ""
                self.searchUsers.append(userName)
            }
            
            
            
        }
        print(searchUsers)
        updateUI()
    }
    
    
    func updateUI() {
        tableView.reloadData()
    }
    
}

extension NewChatRoomView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = searchUsers[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let chatKey = FirebaseManager.shared.ref.child("chats").childByAutoId().key else { return }
        
        let chat = [
            "chatName": searchUsers[indexPath.row]
        ]
        FirebaseManager.shared.ref.child("chats/\(chatKey)").setValue(chat)
        
        let chatVC = ChatRoomViewController()
        navigationController?.pushViewController(chatVC, animated: true)
    }
    
    
}
