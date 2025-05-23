//
//  ViewController.swift
//  theLastPush
//
//  Created by 지영 on 5/19/25.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
    
    private let mainView = MainView()
    
	override func viewWillAppear(_ animated: Bool) {
		navigationController?.isNavigationBarHidden = true
	}

	override func viewWillDisappear(_ animated: Bool) {
		navigationController?.isNavigationBarHidden = true
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        mainView.onIntroButtonTapped = { [weak self] in
            guard let self else { return }
            presentOnboarding()
        }
        
        mainView.onMemberSelected = { [weak self] member in
            guard let self else { return }
            handleMemberSelection(member)
        }
    }

    private func presentOnboarding() {
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
