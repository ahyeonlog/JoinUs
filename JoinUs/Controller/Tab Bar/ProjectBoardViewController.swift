//
//  ProjectBoardViewController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/26.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit

class ProjectBoardViewController: UITableViewController {
        
    // Cell Identifier
    let cellIdentifier = "ProjectCell"

    var projectCells: [ProjectCell] = [ProjectCell]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "프로젝트 게시판"
        tableView.delegate = self
        tableView.dataSource = self
        
        // Registers a class for use in creating new table cells.
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.register(ProjectCustomCell.self, forCellReuseIdentifier: cellIdentifier)
        
        // Add Dummy Data into Array
        createProjectArray()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
    }
    
}


extension ProjectBoardViewController {

    // MARK: - TableView DataSource

    // How many cell will be shown on TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return projectCells.count
    }


    // Create our TableView Cell and return it
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProjectCustomCell
        
        let currentLastItem = projectCells[indexPath.row]
        cell.titleLabel.text = currentLastItem.title
        cell.authorLabel.text = currentLastItem.author
        cell.creationTimeLabel.text = currentLastItem.creationTime
//        cell.likeImage.image = UIImage(named: "like")
        cell.likeCountLabel.text = String(currentLastItem.likeCount!)
        
        


        return cell
    }

    // Append Dummy Data to projectCells Array
    func createProjectArray() {
        
        
        projectCells.append(ProjectCell(title: "JoinUs Project Board Test", author: "여정수", creationTime: "2020-06-15", likeCount: 5, commentCount: 100))
        
        projectCells.append(ProjectCell(title: "Test", author: "Test", creationTime: "2020-06-15", likeCount: 99, commentCount: 99))
    }
    
    
    
    
    //MARK:- TableView Delegate
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

