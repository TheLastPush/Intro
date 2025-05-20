//
//  TeamExpainView.swift
//  theLastPush
//
//  Created by seongjun cho on 5/20/25.
//

import UIKit

import SnapKit

class Team_explain_view: UIView {

	private let logo_image: UIImage
	private let title: String
	private let explain: String
	private let logo_baseColor: UIColor

	let vertical_stackView: UIStackView = {
		let stackView = UIStackView()

		stackView.axis = .vertical
		stackView.distribution = .fill

		return stackView
	}()

	let logo_imageView: UIImageView = {
		let imageView = UIImageView()

		imageView.contentMode = .scaleAspectFit

		return imageView
	}()

	let logo_circleView: UIView = {
		let view = UIView()

		view.layer.cornerRadius = 25

		return view
	}()

	let title_label: UILabel = {
		let label = UILabel()

		return label
	}()

	let expain_textView: UITextView = {
		let textView = UITextView()

		return textView
	}()

	init(logo_image: UIImage, title: String, explain: String, logo_baseColor: UIColor) {
		self.logo_image = logo_image
		self.title = title
		self.explain = explain
		self.logo_baseColor = logo_baseColor

		super.init(frame: .zero)

		setupView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupView() {
		backgroundColor = .white
		logo_imageView.image = logo_image
		logo_circleView.backgroundColor = logo_baseColor
		title_label.text = title
		expain_textView.text = explain

		addSubview(vertical_stackView)
		addSubview(logo_circleView)
		logo_circleView.addSubview(logo_imageView)
		vertical_stackView.addArrangedSubview(title_label)
		vertical_stackView.addArrangedSubview(expain_textView)

		logo_circleView.snp.makeConstraints { make in
			make.top.leading.equalToSuperview()
			make.width.height.equalTo(50)
		}

		logo_imageView.snp.makeConstraints { make in
			make.center.equalToSuperview()
			make.width.height.equalTo(30)
		}

		vertical_stackView.snp.makeConstraints { make in
			make.top.bottom.equalToSuperview()
			make.trailing.equalToSuperview().inset(24)
			make.leading.equalTo(logo_imageView.snp.trailing).offset(24)
		}
	}
}
