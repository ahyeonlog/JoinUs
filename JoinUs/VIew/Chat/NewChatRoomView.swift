//
//  NewChatRoomView.swift
//  JoinUs
//
//  Created by Ahyeon Gil on 2020/06/24.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit


class NewChatRoomView: UIViewController {

    var searchUsers = [String]()
    
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "친구 찾기"
        return searchBar
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    func setUpView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }

    
}
