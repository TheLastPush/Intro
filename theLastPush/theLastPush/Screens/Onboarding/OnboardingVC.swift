//
//  OnboardingVC.swift
//  theLastPush
//
//  Created by 지영 on 5/20/25.
//

import UIKit

class OnboardingVC: UIViewController {

	private let onboardingView = OnBoardingView()

	override func loadView() {
		view = onboardingView
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		onboardingView.next_button.addTarget(self, action: #selector(tap_next_button), for: .touchUpInside)
    }

	@objc func tap_next_button() {
		let vc = MainVC()

		vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
		present(vc, animated: false)
	}
}
