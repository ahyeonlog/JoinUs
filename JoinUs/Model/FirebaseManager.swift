//
//  FirebaseManager.swift
//  JoinUs
//
//  Created by Ahyeon Gil on 2020/06/24.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager {
    static let shared = FirebaseManager()
    
    let ref = Database.database().reference()
    
}
