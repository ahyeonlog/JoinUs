//
//  TabBarController.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/05/26.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor(rgb: Constants.colorHexValue)
//        navigationController?.navigationItem.hidesBackButton = true
        
        
        setUpTabBar()
    }
    
    // TabBar 설정 함수
    func setUpTabBar() {
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem.image = UIImage(named: "home")
        homeVC.tabBarItem.title = "Home"
        
        let projectVC = UINavigationController(rootViewController: ProjectBoardViewController())
        projectVC.tabBarItem.image = UIImage(named: "project_board")
        projectVC.tabBarItem.title = "프로젝트 게시판"
        
        let generalVC = UINavigationController(rootViewController: GeneralBoardViewController())
        generalVC.tabBarItem.image = UIImage(named: "general_board")
        generalVC.tabBarItem.title = "자유게시판"
        
        let chatVC = UINavigationController(rootViewController: ChatViewController())
        chatVC.tabBarItem.image = UIImage(named: "chat")
        chatVC.tabBarItem.title = "채팅"
        
        let userVC = UINavigationController(rootViewController: UserViewController())
        userVC.tabBarItem.image = UIImage(named: "user")
        userVC.tabBarItem.title = "내 정보"
        
        viewControllers = [homeVC, projectVC, generalVC, chatVC, userVC]
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

