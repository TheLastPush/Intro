//
//  JuseojoVC.swift
//  theLastPush
//
//  Created by 지영 on 5/20/25.
//

import UIKit

class JuseojoVC: UIViewController {

	let juseojoView = JuseojoView()

	override func loadView() {
		view = juseojoView
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		juseojoView.backButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
		juseojoView.heartButton.addTarget(self, action: #selector(tapHeartButton(_:)), for: .touchUpInside)
		juseojoView.docButton.addTarget(self, action: #selector(tapDocButton), for: .touchUpInside)
		juseojoView.gitButton.addTarget(self, action: #selector(tapGitButton), for: .touchUpInside)
		juseojoView.velogButton.addTarget(self, action: #selector(tapVelogButton), for: .touchUpInside)
    }

	@objc func tapBackButton() {
		print("back tapped")
		self.navigationController?.popViewController(animated: true)
	}

	@objc func tapHeartButton(_ sender: UIButton) {
		print("heart tapped")
		sender.isSelected.toggle()
	}

	@objc func tapDocButton() {
		print("doc tapped")
		guard let url = URL(string: "https://juseojo.github.io/") else {
			return
		}

		UIApplication.shared.open(url, options: [:])
	}

	@objc func tapGitButton() {
		print("git tapped")
		guard let url = URL(string: "https://github.com/juseojo") else {
			return
		}

		UIApplication.shared.open(url, options: [:])
	}

	@objc func tapVelogButton() {
		print("velog tapped")
		guard let url = URL(string: "https://velog.io/@juseojo/posts") else {
			return
		}

		UIApplication.shared.open(url, options: [:])
	}
}
