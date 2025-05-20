//
//  OnboardingView.swift
//  theLastPush
//
//  Created by seongjun cho on 5/20/25.
//

import UIKit

import SnapKit

class OnBoardingView: UIView {

	let title_label: UILabel = {
		let label = UILabel()

		label.text = "The Last Push"
		label.textAlignment = .center

		return label
	}()

	let sub_title_label: UILabel = {
		let label = UILabel()

		label.text = "마지막 푸시라고 했잖아!"
		label.textAlignment = .left

		return label
	}()

	let next_button: UIButton = {
		let button = UIButton(type: .system)

		button.setTitle("팀원에 대해 알아보기", for: .normal)

		return button
	}()

	let first_team_explain_view: Team_explain_view = {
		let team_expain_view = Team_explain_view(
			logo_image: UIImage(systemName: "person.3.fill")!,
			title: "우리 팀은...",
			explain: "내일배움캠프 iOS 마스터 과정 7기의 수강생들로 이루어져 있습니다.",
			logo_baseColor: UIColor(red: 163 / 255, green: 201 / 255, blue: 255 / 255, alpha: 1.0))

		return team_expain_view
	}()

	let second_team_explain_view: Team_explain_view = {
		var logo_image =
			UIImage(systemName: "person.fill")!.withTintColor(
				UIColor(red: 125 / 255, green: 60 / 255, blue: 152 / 255, alpha: 1.0), renderingMode: .alwaysOriginal)
		let team_expain_view = Team_explain_view(
			logo_image: logo_image,
			title: "프로젝트 INTRO는...",
			explain: "협업의 가치를 배우기 위한 The Last Push의  팀  프로젝트 입니다.",
			logo_baseColor: UIColor(red: 216 / 255, green: 180 / 255, blue: 226 / 255, alpha: 1.0))

		return team_expain_view
	}()

	let third_team_explain_view: Team_explain_view = {
		var logo_image =
			UIImage(systemName: "star")!.withTintColor(
				UIColor(red: 29 / 255, green: 122 / 255, blue: 82 / 255, alpha: 1.0), renderingMode: .alwaysOriginal)
		let team_expain_view = Team_explain_view(
			logo_image: logo_image,
			title: "우리 팀의 궁극적인 목표는...",
			explain: "개발보다 중요한건, 함께 소통하고 성장하는 경험이라고 믿으며 팀워크, 커뮤니케이션 책임감 같은 협업의 기술을 배우는 것을 목표로 하고 있습니다.",
			logo_baseColor: UIColor(red: 184 / 255, green: 231 / 255, blue: 194 / 255, alpha: 1.0))

		return team_expain_view
	}()

	let fourth_team_explain_view: Team_explain_view = {
		var logo_image =
			UIImage(systemName: "person.fill")!.withTintColor(
				UIColor(red: 192 / 255, green: 57 / 255, blue: 43 / 255, alpha: 1.0), renderingMode: .alwaysOriginal)
		let team_expain_view = Team_explain_view(
			logo_image: logo_image,
			title: "우리 팀만의 약속은...",
			explain: "책임 - 맡은 일은 끝까지 책임지고 완수합니다. 배려 - 서로의 입장을 이해하고 존중합니다. 피드백 - 솔직하게 말하되, 성장으로 이어지는 대화를 나눕니다.",
			logo_baseColor: UIColor(red: 255 / 255, green: 179 / 255, blue: 172 / 255, alpha: 1.0))

		return team_expain_view
	}()
	override init(frame: CGRect) {
		super.init(frame: frame)

		backgroundColor = .white

		addSubview(title_label)
		addSubview(sub_title_label)
		addSubview(first_team_explain_view)
		addSubview(second_team_explain_view)
		addSubview(third_team_explain_view)
		addSubview(fourth_team_explain_view)
		addSubview(next_button)

		title_label.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(104)
			make.leading.trailing.equalToSuperview()
			make.height.equalTo(36)
		}

		sub_title_label.snp.makeConstraints { make in
			make.top.equalTo(title_label.snp.bottom).offset(8)
			make.leading.trailing.equalToSuperview()
			make.height.equalTo(30)
		}

		first_team_explain_view.snp.makeConstraints { make in
			make.top.equalTo(sub_title_label.snp.bottom).offset(40)
			make.leading.trailing.equalToSuperview().offset(20)
			make.height.equalTo(63)
		}

		second_team_explain_view.snp.makeConstraints { make in
			make.top.equalTo(first_team_explain_view.snp.bottom).offset(40)
			make.leading.trailing.equalToSuperview().offset(20)
			make.height.equalTo(66)
		}

		third_team_explain_view.snp.makeConstraints { make in
			make.top.equalTo(second_team_explain_view.snp.bottom).offset(40)
			make.leading.trailing.equalToSuperview().offset(20)
			make.height.equalTo(106)
		}

		fourth_team_explain_view.snp.makeConstraints { make in
			make.top.equalTo(third_team_explain_view.snp.bottom).offset(40)
			make.leading.trailing.equalToSuperview().offset(20)
			make.height.equalTo(94)
		}
		next_button.snp.makeConstraints { make in
			make.bottom.equalToSuperview().inset(40)
			make.leading.trailing.equalToSuperview()
			make.height.equalTo(48)
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
