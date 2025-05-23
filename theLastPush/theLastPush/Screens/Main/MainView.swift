//
//  MainView.swift
//  theLastPush
//
//  Created by 지영 on 5/23/25.
//

import UIKit

class MainView: UIView {
    
    private let collectionView = MemberCollectionView()
    var onIntroButtonTapped: (() -> Void)?
    var onMemberSelected: ((Member) -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "THE LAST PUSH"
        label.font = UIFont.ibmPlexSansKR(size: 36, weight: .black)
        label.textColor = .black
        label.textAlignment = .center
        label.shadowColor = UIColor(white: 0, alpha: 0.2)
        label.shadowOffset = CGSize(width: 0, height: 3)
        return label
    }()
    
    private let introButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "IntroButton")
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView()  {
        self.addSubview(titleLabel)
        self.addSubview(introButton)
        self.addSubview(collectionView)
        self.backgroundColor = .white
        
        collectionView.onMemberSelected = { [weak self] member in
            guard let self else { return }
            onMemberSelected?(member)
        }
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(56)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        introButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(60)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(introButton.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
    }
    
    @objc private func introButtonTapped() {
        onIntroButtonTapped?()
    }
}
