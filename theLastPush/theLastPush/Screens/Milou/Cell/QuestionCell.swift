//
//  QuestionCell.swift
//  theLastPush
//
//  Created by 지영 on 5/21/25.
//

import UIKit

class QuestionCell: UITableViewCell {
    static let reuseIdentifier = "QuestionCell"

    private let chattingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner ]
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.introRed.cgColor
        return view
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.ibmPlexSansKR(size: 15, weight: .medium)
        return label
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
        contentView.addSubview(chattingView)
        chattingView.addSubview(messageLabel)
        
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func setupConstraints() {
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
