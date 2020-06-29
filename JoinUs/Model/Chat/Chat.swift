//
//  Chat.swift
//  JoinUs
//
//  Created by Ahyeon Gil on 2020/06/24.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import Foundation

struct Chat {
    var users: [String]?
    var messages: [String: Message]?
    var lastTime: Date?
}
