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

		onboardingView.nextButton.addTarget(self, action: #selector(TapNextButton), for: .touchUpInside)
    }

	@objc func TapNextButton() {
		if self.navigationController?.topViewController == self {
			let vc = UINavigationController(rootViewController: MainVC())

			vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
			present(vc, animated: false)
		}
		else {
			dismiss(animated: true)
		}
	}
}
