//
//  ViewController.swift
//  theLastPush
//
//  Created by 지영 on 5/19/25.
//

import SnapKit
import UIKit

class MainVC: UIViewController {
    
    private let members: [Member] = memberData
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "THE LAST PUSH"
        label.font = UIFont(name: "NunitoSans-12ptExtraLight_Black", size: 36)
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
    
    private lazy var membersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(MemberCell.self, forCellWithReuseIdentifier: MemberCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI()  {
        setupTitleLabel()
        setupIntroButton()
        setUpMembersCollectionView()
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(56)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
    
    private func setupIntroButton() {
        view.addSubview(introButton)
        introButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        
        introButton.addTarget(self, action: #selector(introButtonTapped), for: .touchUpInside)
    }
    
    private func setUpMembersCollectionView() {
        view.addSubview(membersCollectionView)
        membersCollectionView.snp.makeConstraints { make in
            make.top.equalTo(introButton.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
    }
    
    // TODO: 온보딩으로 이동
    @objc private func introButtonTapped() {
            print("온보딩 페이지로 이동!")
    }
    
}
extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberCell.identifier, for: indexPath) as? MemberCell else { return UICollectionViewCell() }
        cell.configure(with: members[indexPath.item])
        return cell
    }
    
    // TODO: 멤버 페이지로 이동
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let member = members[indexPath.item]
        print("\(member.name) 페이지로 이동!")
    }
    
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 2
        return CGSize(width: width, height: width * 1.3)
    }
}
