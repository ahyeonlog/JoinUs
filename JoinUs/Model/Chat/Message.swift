//
//  Message.swift
//  JoinUs
//
//  Created by Ahyeon Gil on 2020/06/24.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import Foundation
import MessageKit


struct Message: MessageType {
    var sender: SenderType
    var messageId: String = ""
    var sentDate: Date
    //text, 사진, 오디오 등등 메세지 종류
    var kind: MessageKind
}

