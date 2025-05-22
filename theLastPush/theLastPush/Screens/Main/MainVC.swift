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

	override func viewWillAppear(_ animated: Bool) {
		navigationController?.isNavigationBarHidden = true
	}

	override func viewWillDisappear(_ animated: Bool) {
		navigationController?.isNavigationBarHidden = true
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
        view.backgroundColor = .white
    }
    
    private func setupView()  {
        view.addSubview(titleLabel)
        view.addSubview(introButton)
        view.addSubview(membersCollectionView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(56)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        introButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(60)
        }
        
        introButton.addTarget(self, action: #selector(introButtonTapped), for: .touchUpInside)
    }
    
    
    private func setUpMembersCollectionView() {
        membersCollectionView.snp.makeConstraints {
            $0.top.equalTo(introButton.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
    }
    
    @objc private func introButtonTapped() {
        let vc = OnboardingVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberCell.identifier, for: indexPath) as? MemberCell else { return UICollectionViewCell() }
        cell.configure(with: members[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let member = members[indexPath.item]
		var nextViewController: UIViewController
        print("\(member.name) 페이지로 이동!")

		switch member.name {
		case "조성준":
			nextViewController = JuseojoVC()
		case "양지영":
            guard let milou = members.first(where: { $0.name == "양지영" }) else {
                    print("못찾음")
                    return
                }
            nextViewController = MilouVC(member: milou)
		case "서광용":
			nextViewController = MoriVC()
		case "이태윤":
			nextViewController = PuddingVC()
		default:
			nextViewController = JuseojoVC()
		}
        
		self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 2
        return CGSize(width: width, height: width * 1.3)
    }
}

extension MainVC: UICollectionViewDelegate {
}
