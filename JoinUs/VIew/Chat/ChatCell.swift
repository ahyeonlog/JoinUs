//
//  ChatCell.swift
//  JoinUs
//
//  Created by Ahyeon Gil on 2020/06/24.
//  Copyright © 2020 iosNowon. All rights reserved.
//

import UIKit


class ChatCell: UITableViewCell {
    static let identifier = "ChatCell"
    

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
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: -Properties
    //채팅방 이미지
    let chatRoomImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "blank-profile-picture")
        img.contentMode = .scaleToFill
        img.layer.cornerRadius = 35
        //view 밖의 image 자르기
        img.clipsToBounds = true
        
        return img
    }()
    
    //채팅방 이름
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    //마지막 대화내용
    let lastMessageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "lastmessage"
        
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    
    func setUpView() {
        //addSubview
        contentView.addSubview(chatRoomImage)
        containerView.addSubview(nameLabel)
        containerView.addSubview(lastMessageLabel)
        contentView.addSubview(containerView)
        
        //autolayout
        chatRoomImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(self.chatRoomImage.snp.width)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(chatRoomImage.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(containerView)
        }
        
        lastMessageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom)
            make.bottom.leading.trailing.equalTo(containerView)
        }

    }

}
