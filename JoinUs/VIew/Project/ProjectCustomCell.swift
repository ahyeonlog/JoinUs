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
//        likeImageConstraints()
        likeCountLabelConstraints()
        
        //        self.contentView.addSubview(nameLabel)
        //        self.contentView.addSubview(creationTimeLabel)
        //        self.contentView.addSubview(likeCountLabel)
        //        self.contentView.addSubview(commentCountLabel)
        //        self.contentView.addSubview(likeImage)
        //        self.contentView.addSubview(commentImage)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // 글 제목 Label
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 작성자 Label
    let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(rgb: Constants.colorHexValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 작성 시간 Label
    let creationTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 좋아요 이미지
    let likeImage: UIImageView = {
        var img = UIImageView(frame: CGRect(x: 5, y: 5, width: 5, height: 5))
        img.image = UIImage(imageLiteralResourceName: "like")
//        let img = UIImageView(image: UIImage(named: "like"))
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 15
        img.frame.size = CGSize(width: 4, height: 8)
        img.clipsToBounds = true
        
        return img
    }()
    
    // 좋아요 개수 Label
    let likeCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 댓글 이미지
    let commentImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "comment"))
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 15
        img.frame.size = CGSize(width: 8, height: 9)
        img.clipsToBounds = true
        
        return img
    }()
    
    // 댓글 개수 Label
    let commentCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
//MARK:- Constraints
    
    // 제목 제약
    func titleLabelConstraints() {
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(10)
            make.leading.equalTo(contentView).offset(15)
        }
    }
    
    // 작성자 제약
    func authorLabelConstraints() {
        self.contentView.addSubview(authorLabel)
        authorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel).offset(20)
            make.leading.equalTo(titleLabel)
            
//            make.leading.equalTo(contentView).offset(15)
//            make.bottom.equalTo(contentView).offset(10)
        }
    }
    
    // 작성 시간 제약
    func creationTimeConstraints() {
        self.contentView.addSubview(creationTimeLabel)
        creationTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(authorLabel)
            make.leading.equalTo(authorLabel).offset(30)
            
        }
    }
    
    // 좋아요 이미지 제약
    func likeImageConstraints() {
        self.contentView.addSubview(likeImage)
        likeImage.snp.makeConstraints { (make) in
            make.leading.equalTo(creationTimeLabel).offset(15)
            make.bottom.equalTo(contentView).offset(5)
        }
    }
    
    // 좋아요 개수 제약
    func likeCountLabelConstraints() {
        self.contentView.addSubview(likeCountLabel)
        likeCountLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(likeCountLabel).offset(5)
            make.bottom.equalTo(contentView).offset(10)
        }
    }
    
    
    
}
