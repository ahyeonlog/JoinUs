//
//  ProjectCustomCell.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/06/14.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit

/*
    프로젝트 셀
    - 게시글 타이틀 : 제목을 입력해 주세요
    - 게시글 본문내용
    - 작성자 닉네임
    - 작성 시간
    - 댓글 개수
    - 좋아요 개수
 
    취소, 등록
 */

struct ProjectPost {
    
    var author: String?              // 게시글 작성자
    var title: String?              // 게시글 타이틀
    var contents: String?           // 게시글 본문
    var createTime: String?        // 게시글 작성 시간
    var likeCount: Int?              // 좋아요 개수
    var commentCount: Int?           // 댓글 개수
    
}
