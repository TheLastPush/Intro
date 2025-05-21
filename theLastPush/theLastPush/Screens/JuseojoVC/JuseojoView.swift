//
//  JuseojoView.swift
//  theLastPush
//
//  Created by seongjun cho on 5/20/25.
//

import UIKit

import SnapKit

class JuseojoView: UIView {

	let backButton: UIButton = {
		let button = UIButton()

		button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)

		return button
	}()

	let miniProfileImage: UIImageView = {
		let imageView = UIImageView()
		
		imageView.image = UIImage(systemName: "person.circle")
		
		return imageView
	}()

	let nameLabel: UILabel = {
		let label = UILabel()
		
		label.text = "조성준"

		return label
	}()

	let profileImage: UIImageView = {
		let imageView = UIImageView()
		
		imageView.image = UIImage(systemName: "person.circle")
		
		return imageView
	}()

	let heartButton: UIButton = {
		let button = UIButton()
		let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
		let image = UIImage(systemName: "heart", withConfiguration: config)

		button.setImage(image, for: .normal)
		button.tintColor = .black

		return button
	}()

	let docButton: UIButton = {
		let button = UIButton()
		let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
		let image = UIImage(systemName: "text.document", withConfiguration: config)

		button.setImage(image, for: .normal)
		button.tintColor = .black

		return button
	}()

	let gitButton: UIButton = {
		let button = UIButton()
		
		button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
		
		return button
	}()

	let velogButton: UIButton = {
		let button = UIButton()
		
		button.setImage(UIImage(systemName: "link"), for: .normal)
		
		return button
	}()

	let explainTextView: UITextView = {
		let textView = UITextView()

		return textView
	}()

	override init (frame: CGRect) {
		super.init(frame: frame)

		backgroundColor = .white
		let screen = UIScreen.main.bounds

		addSubview(backButton)
		addSubview(miniProfileImage)
		addSubview(nameLabel)
		addSubview(profileImage)
		addSubview(heartButton)
		addSubview(docButton)
		addSubview(gitButton)
		addSubview(velogButton)
		addSubview(explainTextView)

		backButton.snp.makeConstraints { make in
			make.top.equalTo(self.safeAreaLayoutGuide)
			make.leading.equalToSuperview().offset(8)
			make.width.height.equalTo(24)
		}

		miniProfileImage.snp.makeConstraints { make in
			make.top.equalTo(backButton.snp.bottom).offset(20)
			make.leading.equalToSuperview().offset(8)
			make.width.height.equalTo(30)
		}

		nameLabel.snp.makeConstraints { make in
			make.leading.equalTo(miniProfileImage.snp.trailing).offset(8)
			make.centerY.equalTo(miniProfileImage)
			make.height.equalTo(20)
			make.trailing.equalToSuperview()
		}

		profileImage.snp.makeConstraints { make in
			make.top.equalTo(miniProfileImage.snp.bottom).offset(8)
			make.leading.trailing.equalToSuperview()
			make.height.equalTo(screen.width)
		}

		heartButton.snp.makeConstraints { make in
			make.top.equalTo(profileImage.snp.bottom).offset(4)
			make.leading.equalToSuperview().offset(8)
			make.width.height.equalTo(30)
		}

		docButton.snp.makeConstraints { make in
			make.top.equalTo(profileImage.snp.bottom).offset(4)
			make.leading.equalTo(heartButton.snp.trailing).offset(16)
			make.width.height.equalTo(30)
		}

		gitButton.snp.makeConstraints { make in
			make.top.equalTo(profileImage.snp.bottom).offset(4)
			make.leading.equalTo(docButton.snp.trailing).offset(16)
			make.width.height.equalTo(30)
		}

		velogButton.snp.makeConstraints { make in
			make.top.equalTo(profileImage.snp.bottom).offset(4)
			make.leading.equalTo(gitButton.snp.trailing).offset(16)
			make.width.height.equalTo(30)
		}

		explainTextView.snp.makeConstraints { make in
			make.top.equalTo(heartButton.snp.bottom).offset(16)
			make.leading.trailing.equalToSuperview().offset(16)
			make.bottom.equalTo(self.safeAreaLayoutGuide)
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
