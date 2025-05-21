//
//  AnswerCell.swift
//  theLastPush
//
//  Created by 지영 on 5/21/25.
//

import UIKit

class AnswerCell: UITableViewCell {

    static let reuseIdentifier = "AnswerCell"
    
    private let profileImageView = UIImageView()
    private let messageLabel = UILabel()
    private let chattingView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        contentView.addSubview(profileImageView)
        
        chattingView.backgroundColor = .white
        chattingView.clipsToBounds = true
        chattingView.layer.cornerRadius = 20
        chattingView.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner ]
        contentView.addSubview(chattingView)
        
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .black
        messageLabel.font = UIFont(name: "IBMPlexSansKR-Medium", size: 15)
        chattingView.addSubview(messageLabel)
        
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(48)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalTo(chattingView.snp.bottom)
        }
        
        chattingView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalTo(profileImageView.snp.leading).offset(-8)
            $0.bottom.equalToSuperview().offset(-8)
            $0.width.lessThanOrEqualTo(contentView.snp.width).multipliedBy(0.7)
        }
        
        messageLabel.snp.makeConstraints {
            $0.edges.equalTo(chattingView).inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
    }
    
    func configure(with message: String, profileImage: UIImage) {
        messageLabel.text = message
        profileImageView.image = profileImage
    }
    
}
