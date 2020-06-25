//
//  ProjectBoardViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/26.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ProjectBoardViewController: UITableViewController {
    
    // Cell Identifier
    let cellIdentifier = "ProjectCell"
    
    // PostList array
    var postList = [ProjectPost]()
    let projectPostRef = Database.database().reference().child("ProjectPosts")
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrivePosts()
        tableView.reloadData()
        // Navigation Controller Setting
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = UIColor.white
        
        // navigation Item Setting
        navigationItem.title = "프로젝트 게시판"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))       // Uncomment the following line to preserve selection between presentations
        
        // Set delegate & datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        // Registers a class for use in creating new table cells.
        tableView.register(ProjectCustomCell.self, forCellReuseIdentifier: cellIdentifier)
        
    }
}


extension ProjectBoardViewController {
    
    // MARK: - TableView DataSource
    
    // How many cell will be shown on TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postList.count
    }
    
    // Create our TableView Cell and return it
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create ProjectCustomcCell.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProjectCustomCell
        
        // Insert Data into CustomCell
        var post = ProjectPost()
        
        post = postList[indexPath.row]
        
        // cell.authorLabel.text = post.author
        cell.titleLabel.text = post.title
        cell.creationTimeLabel.text = post.createTime
        
        if let likeCnt = post.likeCount, let commentCnt = post.commentCount {
            cell.likeCountLabel.text = String(likeCnt)
            cell.commentCountLabel.text = String(commentCnt)
        }
        
        if let uid = post.author {
            print(uid)
            let uidRef = Database.database().reference().child("users").child("\(uid)")
            uidRef.observeSingleEvent(of: .value) { (snapshot) in
                if let data = snapshot.value as? [String:Any] {
                    cell.authorLabel.text = data["name"] as? String ?? ""
                }
            }
        }
        
        // 좋아요 이미지 넣기
        let likeImg: UIImageView = UIImageView(frame: CGRect(x: 345, y: 15, width: 25, height: 25))
        likeImg.image = UIImage(named: "like")
        likeImg.tintColor = .systemBlue
        cell.addSubview(likeImg)
        
        // 댓글 이미지 넣기
        let commmentImg: UIImageView = UIImageView(frame: CGRect(x: 313, y: 15, width: 25, height: 25))
        commmentImg.image = UIImage(named: "chat")
        commmentImg.tintColor = .systemBlue
        cell.addSubview(commmentImg)
        
        return cell
        
        
    }
    
    
    //MARK:- TableView Delegate
    
    // Cell의 높이 지정
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    
    @objc func addTapped() {
        let postView = AddPostView()
        postView.modalPresentationStyle = .fullScreen
        self.present(postView, animated: true, completion: nil)
        
    }
    
    func retrivePosts() {
        projectPostRef.observeSingleEvent(of: .value) { (snapshot) in
            print("Child node's count: \(snapshot.childrenCount)")
            
            if snapshot.childrenCount > 0 {
                for data in snapshot.children.allObjects as! [DataSnapshot] {
                    if let data = data.value as? [String:Any] {
                        
                        //Retrive the data per child
                        
                        // 각 차일드마다 데이터 꺼내서 ProjectPost 타입에 저장해서 PostList에 저장하기
                        var post = ProjectPost()
                        post.author = data["author"] as? String
                        post.title = data["title"] as? String
                        post.contents = data["content"] as? String
                        post.commentCount = data["comment_count"] as? Int
                        post.likeCount = data["like_count"] as? Int
                        post.createTime = data["createTime"] as? String
                        
                        print(post)
                        
                        self.postList.append(post)
                        
                    }
                }
            }
        }
        
    }
    
}

