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
        setupUI()
        
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
        chattingView.layer.borderWidth = 2
        chattingView.layer.borderColor = UIColor.answerRed.cgColor
        contentView.addSubview(chattingView)
        
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .black
        messageLabel.font = UIFont.ibmPlexSansKR(size: 15)
        chattingView.addSubview(messageLabel)
        
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(48)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(chattingView.snp.top)
        }
        
        chattingView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalTo(profileImageView.snp.leading).offset(-8)
            $0.bottom.equalToSuperview().offset(-24)
            $0.width.lessThanOrEqualTo(contentView.snp.width).multipliedBy(0.8)
        }
        
        messageLabel.snp.makeConstraints {
            $0.edges.equalTo(chattingView).inset(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
        }
    }
    
    func configure(with message: String, profileImage: UIImage?) {
        messageLabel.text = message
        profileImageView.image = profileImage
    }
    
}
