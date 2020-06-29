//
//  ChatViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/26.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit

class ChatViewController: UITableViewController {
    
    var chatrooms: [String] = ["chat1", "chat2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "채팅"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "bubble-comment"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(tapComposeChatButton))
        
        
        tableView.register(ChatCell.self, forCellReuseIdentifier: ChatCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func tapComposeChatButton() {
        let newRoom = NewChatRoomView()
        let navVC = UINavigationController(rootViewController: newRoom)
        self.present(navVC, animated: true)
    }
    

}

extension ChatViewController {
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatrooms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatCell.identifier, for: indexPath) as! ChatCell
        cell.nameLabel.text = chatrooms[indexPath.row]
        return cell

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chat = ChatRoomViewController()
        navigationController?.pushViewController(chat, animated: true)
    }
    
    
    
}
