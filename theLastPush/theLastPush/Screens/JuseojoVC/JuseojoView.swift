//
//  JuseojoView.swift
//  theLastPush
//
//  Created by seongjun cho on 5/20/25.
//

import UIKit

import SnapKit

class JuseojoView: UIView {

	let scrollView: UIScrollView = {
		let scrollView = UIScrollView()

		return scrollView
	}()

	let backButton: UIButton = {
		let button = UIButton()
		let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
		let image = UIImage(systemName: "arrow.backward", withConfiguration: config)

		button.setImage(image, for: .normal)
		button.tintColor = .black

		return button
	}()

	let miniProfileImage: UIImageView = {
		let imageView = UIImageView()
		
		imageView.image = UIImage(named: "juseojoNotion")

		return imageView
	}()

	let nameLabel: UILabel = {
		let label = UILabel()
		
		label.text = "조성준"
		label.font = UIFont(name: "IBMPlexSansKR-Regular", size: 16)

		return label
	}()

	let profileImage: UIImageView = {
		let imageView = UIImageView()
		
		imageView.image = UIImage(named: "juseojoProfile")
		imageView.contentMode = .scaleAspectFill

		return imageView
	}()

	let heartButton: UIButton = {
		let button = UIButton()
		let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
		let image = UIImage(systemName: "heart", withConfiguration: config)
		let selected_image = UIImage(systemName: "heart.fill", withConfiguration: config)!
			.withTintColor(.red, renderingMode: .alwaysOriginal)

		button.setImage(image, for: .normal)
		button.setImage(selected_image, for: .selected)
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
		
		button.setImage(UIImage(named: "github"), for: .normal)

		return button
	}()

	let velogButton: UIButton = {
		let button = UIButton()
		
		button.setImage(UIImage(named: "velog"), for: .normal)
		button.layer.masksToBounds = true
		button.layer.cornerRadius = 5

		return button
	}()

	let explainLabel: UILabel = {
		let label = UILabel()
		var attributes = NSMutableAttributedString()
		let mediumFont: [NSAttributedString.Key: Any] = [.font: UIFont(name: "IBMPlexSansKR-Medium", size: 14)!]
		let regularFont: [NSAttributedString.Key: Any] = [.font: UIFont(name: "IBMPlexSansKR-Regular", size: 14)!]
		let blueFont: [NSAttributedString.Key : Any] = [
			.font: UIFont(name: "IBMPlexSansKR-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14),
			.foregroundColor: UIColor.systemBlue,
			.backgroundColor: UIColor.white
		]

		attributes.append(NSAttributedString(string: "조성준   ", attributes: mediumFont))
		attributes.append(NSAttributedString(string: """
								저는 서울 거주하는 98년생 조성준입니다.\n
								객관적으로 바라본 저의 장점은 개인 프로젝트의 경험으로 혼자서 폭 넓은 분야에서 업무가 가능하다는 점입니다. 
								저의 협업 스타일은 프로젝트 전체를 주로 바라보며 진행하는 스타일입니다! 
								4개월동안 잘 부탁드립니다!
								""", attributes: regularFont))
		attributes.append(NSAttributedString(string: "\n\n#iOS #swift #개발", attributes: blueFont))
		label.attributedText = attributes
		label.numberOfLines = 0

		return label
	}()

	override init (frame: CGRect) {
		super.init(frame: frame)

		backgroundColor = .white
		let screen = UIScreen.main.bounds

		addSubview(scrollView)
		scrollView.addSubview(backButton)
		scrollView.addSubview(miniProfileImage)
		scrollView.addSubview(nameLabel)
		scrollView.addSubview(profileImage)
		scrollView.addSubview(heartButton)
		scrollView.addSubview(docButton)
		scrollView.addSubview(gitButton)
		scrollView.addSubview(velogButton)
		scrollView.addSubview(explainLabel)

		scrollView.snp.makeConstraints { make in
			make.edges.equalTo(self.safeAreaLayoutGuide)
		}

		backButton.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(8)
			make.leading.equalToSuperview().offset(16)
			make.width.height.equalTo(30)
		}

		miniProfileImage.snp.makeConstraints { make in
			make.top.equalTo(backButton.snp.bottom).offset(16)
			make.leading.equalToSuperview().offset(8)
			make.width.height.equalTo(36)
		}

		nameLabel.snp.makeConstraints { make in
			make.leading.equalTo(miniProfileImage.snp.trailing).offset(8)
			make.centerY.equalTo(miniProfileImage)
			make.height.equalTo(20)
			make.trailing.equalToSuperview()
		}

		profileImage.snp.makeConstraints { make in
			make.top.equalTo(miniProfileImage.snp.bottom).offset(8)
			make.leading.equalToSuperview()
			make.height.width.equalTo(screen.width)
		}

		heartButton.snp.makeConstraints { make in
			make.top.equalTo(profileImage.snp.bottom).offset(8)
			make.leading.equalToSuperview().offset(8)
			make.width.height.equalTo(30)
		}

		docButton.snp.makeConstraints { make in
			make.top.equalTo(profileImage.snp.bottom).offset(8)
			make.leading.equalTo(heartButton.snp.trailing).offset(16)
			make.width.height.equalTo(30)
		}

		gitButton.snp.makeConstraints { make in
			make.top.equalTo(profileImage.snp.bottom).offset(8)
			make.leading.equalTo(docButton.snp.trailing).offset(16)
			make.width.height.equalTo(30)
		}

		velogButton.snp.makeConstraints { make in
			make.top.equalTo(profileImage.snp.bottom).offset(8)
			make.leading.equalTo(gitButton.snp.trailing).offset(16)
			make.width.height.equalTo(30)
		}

		explainLabel.snp.makeConstraints { make in
			make.top.equalTo(heartButton.snp.bottom).offset(4)
			make.leading.equalToSuperview().offset(12)
			make.width.equalTo(screen.width - 24)
			make.bottom.equalToSuperview().inset(12)
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
