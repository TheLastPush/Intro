//
//  ViewController.swift
//  puddingVC
//
//  Created by 이태윤 on 5/21/25.
//

import UIKit
import SnapKit

class PuddingVC: UIViewController {
    struct Member {
        let name: String
        let profileImage: String
        let mbti: String
        let description: String
        let strength: String
        let collaborationStyle: String
        let blogURL: String
    }
    var pudding = Member(name: "이태윤",
                         profileImage: "pudding",
                         mbti: "ENFP",
                         description: "안녕하세요 저는 부산에 거주중인 2000년생 이태윤 이라고 합니다.",
                         strength: "밝은에너지 책임감 문제해결적 호기심",
                         collaborationStyle: "긍정적인 태도로 팀 분위기를 밝게 만들고,협력을 통해 함께 문제를 해결하며 성장해 나가는 것을 중요하게 생각합니다. 작은 의견도 소중히 여기고 경청하며, 서로를 존중하고 신뢰를 바탕으로 안정감 있는 팀워크를 만들어 갑니다.",
                         blogURL: "https://github.com/Lee-Tae-Yun")
    
    // 프로필 사진, 이름
    let profileImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()

    // 소개
    let aboutMeTitleLabel = UILabel()
    let aboutMeContentLabel = UILabel()

    // 장점
    let strengthsTitleLabel = UILabel()
    let strengthsStackView = UIStackView()

    // 협업 스타일
    let collabTitleLabel = UILabel()
    let collabContentLabel = UILabel()
    
    // 블로그
    let blogButton = UIButton(type: .system)
    
    //뒤로가기
    let backButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        backButton.setImage(UIImage(named: "tyback"), for: .normal)
        backButton.addTarget(self, action: #selector(close), for: .touchUpInside)

        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(30)
        }
        
        // 프로필 부분
        setupProfileSection()
        // 소개 부분
        setupAboutMeSection()
        // 장점 부분
        setupstrengthSection()
        // 블로그 버튼
        setupBlogButton()
        // 협업 스타일 부분
        setupCollaborationSection()
    }
    func setupProfileSection(){
        // 프로필 사진
        profileImageView.image = UIImage(named: pudding.profileImage)
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        
        view.addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        // 제목 라벨
        titleLabel.text = "Personal Page"
        titleLabel.font = UIFont(name: "NunitoSans-12ptExtraLight_Black", size: 24)
        titleLabel.textAlignment = .center
        
        // 이름 라벨
        subtitleLabel.text = pudding.name
        subtitleLabel.font = UIFont(name: "IBMPlexSansKR-Medium", size: 17)
        subtitleLabel.textAlignment = .center
        
        // 화면에 추가
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        
        // 배치
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupAboutMeSection() {
        // 소개 배경 뷰
        let aboutMeContainer = UIView()
        aboutMeContainer.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1.0, alpha: 1.0)
        aboutMeContainer.layer.cornerRadius = 12

        // 소개 제목 라벨
        aboutMeTitleLabel.text = "About Me"
        aboutMeTitleLabel.font = UIFont(name: "NunitoSans-12ptExtraLight_Black", size: 20)
        aboutMeTitleLabel.textAlignment = .left

        // 소개 내용 라벨
        aboutMeContentLabel.text = pudding.description
        aboutMeContentLabel.font = UIFont(name: "IBMPlexSansKR-Regular", size: 15)
        aboutMeContentLabel.numberOfLines = 0
        aboutMeContentLabel.textAlignment = .left
        
        // 화면에 추가
        view.addSubview(aboutMeContainer)
        aboutMeContainer.addSubview(aboutMeTitleLabel)
        aboutMeContainer.addSubview(aboutMeContentLabel)

        // 배치
        aboutMeContainer.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(24)
        }

        aboutMeTitleLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        aboutMeContentLabel.snp.remakeConstraints { make in
            make.top.equalTo(aboutMeTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    func setupstrengthSection(){
        //  장점 배경 뷰
        let strengthsContainer = UIView()
        strengthsContainer.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1.0, alpha: 1.0)
        strengthsContainer.layer.cornerRadius = 12
        
        // 장점 제목 라벨
        strengthsTitleLabel.text = "Strengths"
        strengthsTitleLabel.font = UIFont(name: "NunitoSans-12ptExtraLight_Black", size: 20)
        strengthsTitleLabel.textAlignment = .left
        
        // 수직 스택뷰 설정
        strengthsStackView.axis = .vertical
        strengthsStackView.spacing = 10
        strengthsStackView.alignment = .leading
        strengthsStackView.distribution = .equalSpacing
        
        let strengthItem = pudding.strength.split(separator: " ")
        for (index, item) in strengthItem.enumerated() {
            //아이콘 이미지
            let iconImageView = UIImageView(image: UIImage(named: "icon\(index+1)"))
            iconImageView.contentMode = .scaleAspectFit
            iconImageView.snp.makeConstraints { make in
                make.width.height.equalTo(20)
            }
            // 장점 라벨
            let label = UILabel()
            label.text = String(item)
            label.font = UIFont(name: "IBMPlexSansKR-Reqular", size: 15)
            
            //수평 스택 뷰로 묶기
            let hStack = UIStackView(arrangedSubviews: [iconImageView, label])
            hStack.axis = .horizontal
            hStack.spacing = 8
            hStack.alignment = .center
            
            strengthsStackView.addArrangedSubview(hStack)
        }
        
        // 깃허브 배경 버튼
        blogButton.setImage(UIImage(named: "github2"), for: .normal)
        blogButton.imageView?.contentMode = .scaleAspectFit
        blogButton.backgroundColor = .clear
        blogButton.layer.cornerRadius = 8
        blogButton.addTarget(self, action: #selector(openGitHub), for: .touchUpInside)
        
        //화면에 추가
        view.addSubview(strengthsContainer)
        strengthsContainer.addSubview(strengthsTitleLabel)
        strengthsContainer.addSubview(strengthsStackView)
        strengthsContainer.addSubview(blogButton)

        // 배치
        strengthsContainer.snp.makeConstraints { make in
            make.top.equalTo(aboutMeContentLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(24)
        }

        strengthsTitleLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        strengthsStackView.snp.remakeConstraints { make in
            make.top.equalTo(strengthsTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
        // 깃허브 버튼 배치
        blogButton.snp.remakeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
            make.width.height.equalTo(32)
        }
    }
    
    func setupBlogButton(){
        
        
        
    }
    
    func setupCollaborationSection() {
        // 협업 스타일 배경 뷰
        let collabContainer = UIView()
        collabContainer.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1.0, alpha: 1.0)
        collabContainer.layer.cornerRadius = 12

        // 협업 스타일 제목 라벨
        collabTitleLabel.text = "Collaboration"
        collabTitleLabel.font = UIFont(name: "NunitoSans-12ptExtraLight_Black", size: 24)
        collabTitleLabel.textAlignment = .left

        // 협업 스타일 내용 라벨
        collabContentLabel.text = pudding.collaborationStyle
        collabContentLabel.font = UIFont(name: "IBMPlexSansKR-Reqular", size: 15)
        collabContentLabel.textAlignment = .left
        collabContentLabel.numberOfLines = 0
        
        // 화면에 추가
        view.addSubview(collabContainer)
        collabContainer.addSubview(collabTitleLabel)
        collabContainer.addSubview(collabContentLabel)

        // 배치
        collabContainer.snp.makeConstraints { make in
            make.top.equalTo(strengthsStackView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(24)
        }

        collabTitleLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        collabContentLabel.snp.remakeConstraints { make in
            make.top.equalTo(collabTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    // 깃허브 버튼 이벤트
    @objc func openGitHub() {
        if let url = URL(string: pudding.blogURL) {
            print("github로 이동")
            UIApplication.shared.open(url)
        }
    }
    
    // 뒤로가기
    @objc func close() {
        print("뒤로가기")
        self.navigationController?.popViewController(animated: true)
    }
}
