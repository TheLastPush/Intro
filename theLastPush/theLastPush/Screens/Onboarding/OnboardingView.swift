//
//  OnboardingView.swift
//  theLastPush
//
//  Created by seongjun cho on 5/20/25.
//

import UIKit

import SnapKit

class OnBoardingView: UIView {

	let titleLabel: UILabel = {
		let label = UILabel()

		label.text = "The Last Push"
		label.font = UIFont.nunitoSans(size: 36, weight: .black)
		label.layer.shadowOffset = CGSize(width: 0, height: 2)
		label.layer.shadowOpacity = 0.15
		label.textAlignment = .center


		return label
	}()

	let subTitleLabel: UILabel = {
		let label = UILabel()

		label.text = "마지막 푸시라고 했잖아!"
		label.font = UIFont(name: "IBMPlexSansKR-Medium", size: 20)
		label.textAlignment = .left

		return label
	}()

	let nextButton: UIButton = {
		let button = UIButton(type: .system)

		button.setTitle("팀원에 대해 알아보기", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.titleLabel?.font = UIFont(name: "IBMPlexSansKR-Medium", size: 25)
		button.backgroundColor = .mainYellow
		button.layer.cornerRadius = 10

		return button
	}()

	let firstTeamExplainView: TeamExplainView = {
		let teamExplainView = TeamExplainView(
			logoImage: UIImage(systemName: "person.3.fill")!,
			title: "우리 팀은...",
			explain: "내일배움캠프 iOS 마스터 과정 7기의 수강생들로 이루어져 있습니다.",
			logoBaseColor: UIColor(red: 163 / 255, green: 201 / 255, blue: 255 / 255, alpha: 1.0))

		return teamExplainView
	}()

	let secondTeamExplainView: TeamExplainView = {
		var logoImage =
			UIImage(systemName: "person.fill")!.withTintColor(
				UIColor(red: 125 / 255, green: 60 / 255, blue: 152 / 255, alpha: 1.0), renderingMode: .alwaysOriginal)
		let teamExplainView = TeamExplainView(
			logoImage: logoImage,
			title: "프로젝트 INTRO는...",
			explain: "협업의 가치를 배우기 위한 The Last Push의  팀  프로젝트 입니다.",
			logoBaseColor: UIColor(red: 216 / 255, green: 180 / 255, blue: 226 / 255, alpha: 1.0))

		return teamExplainView
	}()

	let thirdTeamExplainView: TeamExplainView = {
		var logoImage =
			UIImage(systemName: "star")!.withTintColor(
				UIColor(red: 29 / 255, green: 122 / 255, blue: 82 / 255, alpha: 1.0), renderingMode: .alwaysOriginal)
		let teamExplainView = TeamExplainView(
			logoImage: logoImage,
			title: "우리 팀의 궁극적인 목표는...",
			explain: "개발보다 중요한건, 함께 소통하고 성장하는 경험이라고 믿으며 팀워크, 커뮤니케이션 책임감 같은 협업의 기술을 배우는 것을 목표로 하고 있습니다.",
			logoBaseColor: UIColor(red: 184 / 255, green: 231 / 255, blue: 194 / 255, alpha: 1.0))

		return teamExplainView
	}()

	let fourthTeamExplainView: TeamExplainView = {
		var logoImage =
			UIImage(systemName: "link")!.withTintColor(
				UIColor(red: 192 / 255, green: 57 / 255, blue: 43 / 255, alpha: 1.0), renderingMode: .alwaysOriginal)
		let teamExplainView = TeamExplainView(
			logoImage: logoImage,
			title: "우리 팀만의 약속은...",
			explain: """
					책임 - 맡은 일은 끝까지 책임지고 완수합니다.
					배려 - 서로의 입장을 이해하고 존중합니다.
					피드백 - 솔직하게 말하되, 성장으로 이어지는 대화를 나눕니다.
					""",
			logoBaseColor: UIColor(red: 255 / 255, green: 179 / 255, blue: 172 / 255, alpha: 1.0))

		return teamExplainView
	}()
	override init(frame: CGRect) {
		super.init(frame: frame)

		backgroundColor = .white

		addSubview(titleLabel)
		addSubview(subTitleLabel)
		addSubview(firstTeamExplainView)
		addSubview(secondTeamExplainView)
		addSubview(thirdTeamExplainView)
		addSubview(fourthTeamExplainView)
		addSubview(nextButton)

		titleLabel.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(104)
			make.centerX.equalToSuperview()
			make.height.equalTo(36)
		}

		subTitleLabel.snp.makeConstraints { make in
			make.top.equalTo(titleLabel.snp.bottom).offset(8)
			make.leading.equalTo(titleLabel.snp.leading)
			make.trailing.equalToSuperview()
			make.height.equalTo(30)
		}

		firstTeamExplainView.snp.makeConstraints { make in
			make.top.equalTo(subTitleLabel.snp.bottom).offset(20)
			make.leading.trailing.equalToSuperview().offset(20)
			make.height.equalTo(100)
		}

		secondTeamExplainView.snp.makeConstraints { make in
			make.top.equalTo(firstTeamExplainView.snp.bottom).offset(20)
			make.leading.trailing.equalToSuperview().offset(20)
			make.height.equalTo(100)
		}

		thirdTeamExplainView.snp.makeConstraints { make in
			make.top.equalTo(secondTeamExplainView.snp.bottom).offset(20)
			make.leading.trailing.equalToSuperview().offset(20)
			make.height.equalTo(106)
		}

		fourthTeamExplainView.snp.makeConstraints { make in
			make.top.equalTo(thirdTeamExplainView.snp.bottom).offset(20)
			make.leading.trailing.equalToSuperview().offset(20)
			make.height.equalTo(130)
		}

		nextButton.snp.makeConstraints { make in
			make.bottom.equalToSuperview().inset(40)
			make.leading.equalToSuperview().offset(24)
			make.trailing.equalToSuperview().inset(24)
			make.height.equalTo(48)
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
