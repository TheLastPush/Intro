//
//  TeamExpainView.swift
//  theLastPush
//
//  Created by seongjun cho on 5/20/25.
//

import UIKit

import SnapKit

class TeamExplainView: UIView {

	private let logoImage: UIImage
	private let title: String
	private let explain: String
	private let logoBaseColor: UIColor

	let verticalView: UIView = {
		let view = UIView()

		return view
	}()

	let logoImageView: UIImageView = {
		let imageView = UIImageView()

		imageView.contentMode = .scaleAspectFit

		return imageView
	}()

	let logoCircleView: UIView = {
		let view = UIView()

		view.layer.cornerRadius = 25

		return view
	}()

	let titleLabel: UILabel = {
		let label = UILabel()

		label.font = UIFont(name: "IBMPlexSansKR-Bold", size: 20)
		label.frame.size.height = 24

		return label
	}()

	let explainTextView: UITextView = {
		let textView = UITextView()

		textView.font = UIFont(name: "IBMPlexSansKR-Medium", size: 13)
		textView.isEditable = false
		textView.isScrollEnabled = false

		return textView
	}()

	init(logoImage: UIImage, title: String, explain: String, logoBaseColor: UIColor) {
		self.logoImage = logoImage
		self.title = title
		self.explain = explain
		self.logoBaseColor = logoBaseColor

		super.init(frame: .zero)

		setupView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupView() {
		backgroundColor = .white
		logoImageView.image = logoImage
		logoCircleView.backgroundColor = logoBaseColor
		titleLabel.text = title
		explainTextView.text = explain

		addSubview(verticalView)
		addSubview(logoCircleView)
		logoCircleView.addSubview(logoImageView)
		verticalView.addSubview(titleLabel)
		verticalView.addSubview(explainTextView)

		logoCircleView.snp.makeConstraints { make in
			make.top.leading.equalToSuperview()
			make.width.height.equalTo(50)
		}

		logoImageView.snp.makeConstraints { make in
			make.center.equalToSuperview()
			make.width.height.equalTo(30)
		}

		verticalView.snp.makeConstraints { make in
			make.top.bottom.equalToSuperview()
			make.trailing.equalToSuperview().inset(24)
			make.leading.equalTo(logoImageView.snp.trailing).offset(24)
		}

		titleLabel.snp.makeConstraints { make in
			make.top.leading.trailing.equalToSuperview()
			make.height.equalTo(36)
		}

		explainTextView.snp.makeConstraints { make in
			make.top.equalTo(titleLabel.snp.bottom).inset(8)
			make.leading.trailing.bottom.equalToSuperview()
		}
	}
}
