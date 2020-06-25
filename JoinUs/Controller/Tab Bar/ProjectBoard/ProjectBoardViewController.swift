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
    
    var projectCells: [ProjectCell] = [ProjectCell]()
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
        // Add Dummy Data into Array
//        createProjectArray()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
    }
    
}


extension ProjectBoardViewController {
    
    // MARK: - TableView DataSource
    
    // How many cell will be shown on TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rootRef = Database.database().reference()
        let projectCellRef = rootRef.child("projectcell")
        
        return 2
        
        // projectCellRef에서 가장 높은 인덱스 값을 가져와야 한다.
    }
    
    
    // Create our TableView Cell and return it
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create ProjectCustomcCell.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProjectCustomCell
        
        // Insert Data into CustomCell
        let rootRef = Database.database().reference()
        let projectCellRef = rootRef.child("projectcell")
        projectCellRef.child("\(indexPath.row)").observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let data = snapshot.value as? NSDictionary {
                if let title = data["title"], let author = data["author"], let creationTime = data["written_time"], let likeCount = data["like_count"], let commentCount = data["comment_count"] {
                    cell.titleLabel.text = title as? String
                    cell.authorLabel.text = author as? String
                    cell.creationTimeLabel.text = creationTime as? String
                    cell.likeCountLabel.text = likeCount as? String
                    cell.commentCountLabel.text = commentCount as? String
                }
            }
            
        })
        
        
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
    
    // Append Dummy Data to projectCells Array
//    func createProjectArray() {
//
//        projectCells.append(ProjectCell(title: "JoinUs Project Board Test", author: "여정수", creationTime: "2020-06-15", likeCount: 5, commentCount: 100))
//
//        projectCells.append(ProjectCell(title: "Test", author: "Test", creationTime: "2020-06-15", likeCount: 99, commentCount: 99))
//    }
    
    
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
    
    //
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        print(items[indexPath.row])
    //    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

