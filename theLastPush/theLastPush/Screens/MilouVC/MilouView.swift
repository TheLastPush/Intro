//
//  MilouView.swift
//  theLastPush
//
//  Created by 지영 on 5/22/25.
//

import UIKit

protocol MilouViewButtonDelegate: AnyObject {
    func backButtonTapped()
    func blogButtonTapped()
}

class MilouView: UIView {

    private let member: Member
    private let tableView: ChattingTableView
    
    weak var delegate: MilouViewButtonDelegate?

    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.ibmPlexSansKR(size: 32, weight: .black)
        return label
    }()
    
    private let tistoryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tistory"), for: .normal)
        button.tintColor = .systemRed
        return button
    }()
    
    private let introContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let introLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.ibmPlexSansKR(size: 16)
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    
    private let moreLabel: UILabel = {
        let label = UILabel()
        label.text = "🔎 더 알아보기"
        label.font = UIFont.ibmPlexSansKR(size: 18, weight: .bold)
        return label
    }()
    
    init(member: Member) {
        self.member = member
        self.tableView = ChattingTableView(member: member)
        super.init(frame: .zero)
        configure()
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startMessageAnimation() {
            tableView.startMessageAnimation()
        }
    
    private func configure() {
        nameLabel.text = member.name
        introLabel.text = member.description
    }
    
    private func setupView() {
        self.addSubview(backButton)
        self.addSubview(nameLabel)
        self.addSubview(tistoryButton)
        self.addSubview(introContainerView)
        introContainerView.addSubview(introLabel)
        self.addSubview(moreLabel)
        self.addSubview(tableView)
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        tistoryButton.addTarget(self, action: #selector(blogButtonTapped), for: .touchUpInside)
        
        self.backgroundColor = UIColor.backgroundRed
    }
    
    
    private func setupConstraints() {
        backButton.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(44)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(20)
        }
        
        tistoryButton.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(16)
            $0.width.height.equalTo(40)
        }
        
        introContainerView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        introLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16))
        }
        
        moreLabel.snp.makeConstraints {
            $0.top.equalTo(introContainerView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(20)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(moreLabel.snp.bottom).offset(16)
            $0.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    @objc private func backButtonTapped() {
        delegate?.backButtonTapped()
    }
    
    @objc private func blogButtonTapped() {
        delegate?.blogButtonTapped()
    }
}
