//
//  QuestionCell.swift
//  theLastPush
//
//  Created by 지영 on 5/21/25.
//

import UIKit

class QuestionCell: UITableViewCell {
    
    static let reuseIdentifier = "QuestionCell"
    
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
        
        chattingView.backgroundColor = .white
        chattingView.clipsToBounds = true
        chattingView.layer.cornerRadius = 20
        chattingView.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner ]
        chattingView.layer.borderWidth = 2
        chattingView.layer.borderColor = UIColor.introRed.cgColor
        contentView.addSubview(chattingView)
        
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .black
        messageLabel.font = UIFont.ibmPlexSansKR(size: 15, weight: .medium)
        chattingView.addSubview(messageLabel)
        
        chattingView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-8)
            $0.width.lessThanOrEqualTo(contentView.snp.width).multipliedBy(0.8)
        }
        
        messageLabel.snp.makeConstraints {
            $0.edges.equalTo(chattingView).inset(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
        }
    }
    
    func configure(with message: String) {
        messageLabel.text = message
    }
    
}
