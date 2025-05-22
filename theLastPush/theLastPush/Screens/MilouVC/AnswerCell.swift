//
//  AnswerCell.swift
//  theLastPush
//
//  Created by 지영 on 5/21/25.
//

import UIKit

class AnswerCell: UITableViewCell {
    static let reuseIdentifier = "AnswerCell"
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.ibmPlexSansKR(size: 15)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let chattingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner ]
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.answerRed.cgColor
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setupView() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(chattingView)
        chattingView.addSubview(messageLabel)
        
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func setupConstraints() {
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
