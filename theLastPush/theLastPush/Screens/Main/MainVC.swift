//
//  ViewController.swift
//  theLastPush
//
//  Created by 지영 on 5/19/25.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
    
//    private let members: [Member] = memberData
    private let collectionView = MemberCollectionView()
    
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
    }
    
    private func setupView()  {
        view.addSubview(titleLabel)
        view.addSubview(introButton)
        view.addSubview(collectionView)
        
        view.backgroundColor = .white
        
        collectionView.onMemberSelected = { [weak self] member in
            self?.handleMemberSelection(member)
        }
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
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(introButton.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
        
        introButton.addTarget(self, action: #selector(introButtonTapped), for: .touchUpInside)
    }
    
    @objc private func introButtonTapped() {
        let vc = OnboardingVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    private func handleMemberSelection(_ member: Member) {
        var nextViewController: UIViewController
        switch member.name {
        case "조성준":
            nextViewController = JuseojoVC()
        case "양지영":
            nextViewController = MilouVC(member: member)
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






