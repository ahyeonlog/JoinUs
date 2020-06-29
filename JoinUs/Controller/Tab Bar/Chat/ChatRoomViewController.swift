//
//  ChatRoomViewController.swift
//  JoinUs
//
//  Created by Ahyeon Gil on 2020/06/24.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import MessageKit


class ChatRoomViewController: MessagesViewController {
    
    //메세지 보내기 위한 유저 정보
    let currentUser = Sender(senderId: "self", displayName: "아현")
    let otherUser = Sender(senderId: "ohter", displayName: "ios")
    
    
    var messages = [Message]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.title = currentUser.displayName
        
        //메세지 test
        //seconds of day == 86400
        messages.append(Message(sender: currentUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400),
                                kind: .text("Hello Message Test")))
        messages.append(Message(sender: otherUser,
        messageId: "2",
        sentDate: Date().addingTimeInterval(-70000),
        kind: .text("Hi~")))
        messages.append(Message(sender: otherUser,
        messageId: "3",
        sentDate: Date().addingTimeInterval(-26400),
        kind: .text("last message")))
        
        // Set delegate & datasource
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    
}

extension ChatRoomViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        //messageKit에서는 메세지를 섹션으로 구분
        return messages[indexPath.section]
    }
    
    //message 개수
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    

}
