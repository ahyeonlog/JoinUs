//
//  ProjectCustomCell.swift
//  JoinUs
//
//  Created by Yeojaeng on 2020/06/15.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit
import SnapKit

// 프로젝트 게시판에 보여질 커스텀 셀

/*
 var title: String               // 게시글 타이틀
 var author: String              // 게시글 작성자
 var creationTime: String        // 게시글 작성 시간
 var likeCount: Int              // 좋아요 개수
 var commentCount: Int           // 댓글 개수
 */


class ProjectCustomCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabelConstraints()
        authorLabelConstraints()
        creationTimeConstraints()
        likeCountLabelConstraints()
        commentCountLabelConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // 글 제목 Label
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 작성자 Label
    let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(rgb: Constants.colorHexValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 작성 시간 Label
    let creationTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 좋아요 개수 Label
    let likeCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 댓글 개수 Label
    let commentCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
//MARK:- Constraints
    
    // 제목 제약
    func titleLabelConstraints() {
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(contentView).offset(15)
        }
    }
    
    // 작성자 제약
    func authorLabelConstraints() {
        self.contentView.addSubview(authorLabel)
        authorLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(titleLabel)
            make.bottom.equalToSuperview()
            
        }
    }
    
    // 작성 시간 제약
    func creationTimeConstraints() {
        self.contentView.addSubview(creationTimeLabel)
        creationTimeLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(authorLabel).offset(45)
            make.bottom.equalToSuperview()
            
        }
    }
    
    // 좋아요 개수 제약
    func likeCountLabelConstraints() {
        self.contentView.addSubview(likeCountLabel)
        likeCountLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
        }
    }
    
    // 댓글 개수 제약
    func commentCountLabelConstraints() {
        self.contentView.addSubview(commentCountLabel)
        commentCountLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(likeCountLabel).offset(-30)
            make.bottom.equalToSuperview()
        }
    }
    
    
    
}
