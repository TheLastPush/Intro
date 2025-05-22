//
//  MoriVC.swift
//  theLastPush
//
//  Created by 광용 on 5/21/25.
//

import SnapKit
import UIKit

final class MoriVC: UIViewController {
    private let scrollView = UIScrollView() // 스크롤 가능한 화면을 만들기 위한 베이스 View
    private let contentView = UIView() // ScrollView안에 실제 콘텐츠를 넣는 뷰
    private let cardView = UIView() // 흰색 박스 View
    
    private let profileImageView = UIImageView()
    
    private let nameLabel = UILabel()
    private let mbtiLabel = UILabel()
    
    private let introBoxView = UIView() // 자기소개 Box
    private let introTitleLabel = UILabel() // 자기소개 제목
    private let introContentLabel = UILabel() // 자기소개 내용
    
    private let strengthBoxView = UIView() // 나의 장점 Box
    private let strengthTitleLabel = UILabel() // 나의 장점 섹션 제목
    private let strengthStackView = UIStackView() // 키워드와 아이콘
    
    private let collaborationBoxView = UIView() // 스타일 협업 Box
    private let collaborationTitleLabel = UILabel() // 스타일 협업 섹션 제목
    private let collaborationContentLabel = UILabel() // 스타일 협업 내용
    
    private let blogButton = UIButton(type: .system) // 블로그 버튼
    private let gitHubButton = UIButton(type: .system) // GitHub 버튼
    
    private let backButton = UIButton(type: .system)
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupStyle()
        setupData()
        setupActions()
    }
    
    // MARK: - Layout
    private func setupLayout() {
        setupBaseLayout()
        setupBackButtonLayout()
        setupCardViewLayout()
        setupProfileImageLayout()
        setupNameLayout()
        setupIntroLayout()
        setupStrengthLayout()
        setupCollaborationLayout()
        setupBlogButtonLayout()
        setupGitHubButtonLayout()
    }
    
    // MARK: - 데이터 세팅
    private func setupData() {
        nameLabel.text = "서광용"
        mbtiLabel.text = "MBTI: INFJ"
        introContentLabel.text = """
            안녕하세요, 기록하고 정리해 공유하는 것을 
            좋아하는 iOS 개발자 서광용입니다!
            취미로는 사진을 찍으러 다닙니다. 📸 
            """
        collaborationContentLabel.text = "각자의 스타일을 이해하고, 함께 조율하여 맞춰나가려고 노력합니다. 😊"
    }
    
    // MARK: - 베이스 뷰 (스크롤 뷰 + 컨텐츠 뷰)
    private func setupBaseLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in // scrollView의 제약 조건
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in // contentView의 제약 조건
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.greaterThanOrEqualToSuperview() // 최소 높이 제약 추가
        }
    }
    // MARK: - 카드 뷰
    private func setupCardViewLayout() {
        contentView.addSubview(cardView) // 하얀색 박스 영역
        
        cardView.snp.makeConstraints { make in // cardView의 제약 조건
            make.top.equalTo(contentView).offset(50)
            make.leading.trailing.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(20)
        }
    }
    
    //MARK: - 프로필 이미지
    private func setupProfileImageLayout() {
        cardView.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(cardView).offset(24)
            make.centerX.equalTo(cardView)
            make.width.height.equalTo(100)
        }
    }
    
    // MARK: - 이름/MBTI
    private func setupNameLayout() {
        cardView.addSubview(nameLabel)
        cardView.addSubview(mbtiLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(12)
            make.centerX.equalTo(cardView)
        }
        
        mbtiLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.centerX.equalTo(cardView)
        }
    }
    
    // MARK: - 자기소개
    private func setupIntroLayout() {
        cardView.addSubview(introBoxView)
        introBoxView.addSubview(introTitleLabel)
        introBoxView.addSubview(introContentLabel)
        
        introBoxView.snp.makeConstraints { make in
            make.top.equalTo(mbtiLabel.snp.bottom).offset(15)
            make.leading.trailing.equalTo(cardView).inset(16)
        }
        
        introTitleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(12)
        }
        
        introContentLabel.snp.makeConstraints { make in
            make.top.equalTo(introTitleLabel.snp.bottom).offset(12)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - 나의 장점
    private func setupStrengthLayout() {
        cardView.addSubview(strengthBoxView)
        strengthBoxView.addSubview(strengthTitleLabel)
        strengthBoxView.addSubview(strengthStackView)
        
        strengthBoxView.snp.makeConstraints { make in
            make.top.equalTo(introBoxView.snp.bottom).offset(15)
            make.leading.trailing.equalTo(cardView).inset(16)
        }
        
        strengthTitleLabel.snp.makeConstraints { make in // 나의 장점 title 제약조건
            make.top.leading.trailing.equalToSuperview().inset(12)
        }
        
        strengthStackView.snp.makeConstraints { make in // 나의 장점 키워드와 아이콘
            make.top.equalTo(strengthTitleLabel.snp.bottom).offset(12)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.height.equalTo(24)
        }
    }
    
    // MARK: - 스타일 협업
    private func setupCollaborationLayout() {
        cardView.addSubview(collaborationBoxView)
        collaborationBoxView.addSubview(collaborationTitleLabel)
        collaborationBoxView.addSubview(collaborationContentLabel)
        
        collaborationBoxView.snp.makeConstraints { make in
            make.top.equalTo(strengthBoxView.snp.bottom).offset(15)
            make.leading.trailing.equalTo(cardView).inset(16)
        }
        
        collaborationTitleLabel.snp.makeConstraints { make in // 스타일 협업 title 제약조건
            make.top.leading.trailing.equalToSuperview().inset(12)
        }
        
        collaborationContentLabel.snp.makeConstraints { make in // 스타일 협업 내용 제약조건
            make.top.equalTo(collaborationTitleLabel.snp.bottom).offset(12)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Blog 버튼
    private func setupBlogButtonLayout() {
        cardView.addSubview(blogButton)
        
        blogButton.snp.makeConstraints { make in // 블로그 버튼 제약조건
            make.top.equalTo(collaborationContentLabel.snp.bottom).offset(35)
            make.leading.trailing.equalTo(cardView).inset(16)
            make.height.equalTo(44)
        }
    }
    
    // MARK: - GitHub 버튼
    private func setupGitHubButtonLayout() {
        cardView.addSubview(gitHubButton)
        
        gitHubButton.snp.makeConstraints { make in
            make.top.equalTo(blogButton.snp.bottom).offset(8)
            make.leading.trailing.equalTo(cardView).inset(16)
            make.height.equalTo(44)
        }
    }

    // MARK: - Back 버튼
    private func setupBackButtonLayout() {
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(70)
            make.leading.equalToSuperview().offset(8)
            make.width.height.equalTo(44)
        }
    }
    
    private func setupActions() {
        blogButton.addTarget(self, action: #selector(blogButtonTapped), for: .touchUpInside)
        gitHubButton.addTarget(self, action: #selector(gitHubButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Style
    private func setupStyle() {
        setupBaseStyle()
        setupBackButtonStyle()
        setupCardViewStyle()
        setupProfileImageStyle()
        setupNameStyle()
        setupBoxStyle()
        setupIntroStyle()
        setupStrengthStyle()
        setupCollaborationStyle()
        setupBlogButtonStyle()
        setupGitHubButtonStyle()
    }
    
    // MARK: - 베이스 디자인(스크롤 뷰 + 컨텐츠 뷰)
    private func setupBaseStyle() {
        view.backgroundColor = .systemGroupedBackground
        scrollView.backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    // MARK: - 뒤로가기 버튼 디자인
    private func setupBackButtonStyle() {
        let image = UIImage(systemName: "chevron.left")
        backButton.setImage(image, for: .normal)
        backButton.tintColor = .label
    }
    
    // MARK: - 카드 뷰 디자인
    private func setupCardViewStyle() {
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 16
        cardView.layer.masksToBounds = true // 자식 뷰가 둥근 테두리 밖으로 빠져나가면 잘라서 보이지 않도록 함
    }
    
    // MARK: - 프로필 이미지 디자인
    private func setupProfileImageStyle() {
        profileImageView.image = UIImage(named: "member2")
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true // 이미지 뷰의 프레임을 벗어나는 부분을 잘라냄
        profileImageView.contentMode = .scaleAspectFill //
    }
    
    // MARK: - 이름/MBTI 디자인
    private func setupNameStyle() {
        nameLabel.font = UIFont.ibmPlexSansKR(size: 25, weight: .bold)
        nameLabel.textColor = .label
        
        mbtiLabel.font = UIFont.nunitoSans(size: 17)
        mbtiLabel.textColor = .secondaryLabel
    }
    
    // MARK: - Box View 디자인
    private func setupBoxStyle() {
        [introBoxView, strengthBoxView, collaborationBoxView].forEach {
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 12
        }
    }
    
    // MARK: - 자기소개 디자인
    private func setupIntroStyle() {
        introTitleLabel.text = "자기소개"
        introTitleLabel.font = UIFont.ibmPlexSansKR(size: 17, weight: .bold)
        introTitleLabel.textColor = .label
        
        introContentLabel.font = UIFont.ibmPlexSansKR(size: 15)
        introContentLabel.textColor = .darkGray
        introContentLabel.numberOfLines = 0 // 줄 수 제한 없앰
        introContentLabel.lineBreakMode = .byWordWrapping // 단어 단위로 자연스럽게 줄 바꿈
    }
    
    // MARK: - 나의 장점 디자인
    private func setupStrengthStyle() {
        strengthTitleLabel.text = "나의 장점"
        strengthTitleLabel.font = UIFont.ibmPlexSansKR(size: 17, weight: .bold)
        strengthTitleLabel.textColor = .label
        
        strengthStackView.axis = .horizontal // horizontal(수평 방향)
        strengthStackView.spacing = 10 // 뷰 사이의 인덱싱(공간)
        strengthStackView.distribution = .fillProportionally // 고유한 크기의 비율로 나눔
        
        let strength1 = makeIconLabel(text: "💎 성실함")
        let strength2 = makeIconLabel(text: "📋 꼼꼼함")
        let strength3 = makeIconLabel(text: "🔍 집중력")
        let strength4 = makeIconLabel(text: "🕊️ 배려심")
        
        [strength1, strength2, strength3, strength4].forEach { strengthStackView.addArrangedSubview($0) }
        // addArrangedSubview: addSubView에서, StackView가 직접 위치와 크기를 자동으로 정렬
    }
    
    // MARK: - 스타일 협업 디자인
    private func setupCollaborationStyle() {
        collaborationTitleLabel.text = "스타일 협업"
        collaborationTitleLabel.font = UIFont.ibmPlexSansKR(size: 17, weight: .bold)
        collaborationTitleLabel.textColor = .label

        collaborationContentLabel.font = UIFont.ibmPlexSansKR(size: 15)
        collaborationContentLabel.textColor = .darkGray
        collaborationContentLabel.numberOfLines = 0
        collaborationContentLabel.lineBreakMode = .byWordWrapping
    }
    
    // MARK: - Blog 버튼 디자인
    private func setupBlogButtonStyle() {
        blogButton.setTitle("블로그 보러가기", for: .normal)
        blogButton.setTitleColor(.white, for: .normal)
        blogButton.backgroundColor = .systemPurple
        blogButton.titleLabel?.font = UIFont.ibmPlexSansKR(size: 15, weight: .medium)
        blogButton.layer.cornerRadius = 8
    }
    
    // MARK: - GitHub 버튼 디자인
    private func setupGitHubButtonStyle() {
        gitHubButton.setTitle("깃허브 보러가기", for: .normal)
        gitHubButton.setTitleColor(.white, for: .normal)
        gitHubButton.backgroundColor = .systemPurple
        gitHubButton.titleLabel?.font = UIFont.ibmPlexSansKR(size: 15, weight: .medium)
        gitHubButton.layer.cornerRadius = 8
    }
    
    // MARK: - UI 요소 생성
    private func makeIconLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.ibmPlexSansKR(size: 15)
        label.textColor = .darkGray
        label.text = text
        return label
    }
    
    // MARK: - Blog 버튼 액션
    @objc private func blogButtonTapped() {
        guard let url = URL(string: "https://jud00.tistory.com/") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil) // url 열기
    }
    
    // MARK: - GitHub 버튼 액션
    @objc private func gitHubButtonTapped() {
        guard let url = URL(string: "https://github.com/Gwangyong") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    // MARK: - back 버튼 액션
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
