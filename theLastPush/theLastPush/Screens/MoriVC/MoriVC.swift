//
//  MoriVC.swift
//  theLastPush
//
//  Created by 지영 on 5/20/25.
//

import SnapKit
import UIKit

final class MoriVC: UIViewController {
    
    
    // MARK: - UI Components
    private let scrollView = UIScrollView() // 스크롤 가능한 화면을 만들기 위한 베이스 View
    private let contentView = UIView() // ScrollView안에 실제 콘텐츠를 넣는 뷰
    private let cardView = UIView() // 흰색 박스 View
    
    private let nameLabel = UILabel()
    private let mbtiLabel = UILabel()
    
    private let introTitleLabel = UILabel() // 자기소개 제목
    private let introContentLabel = UILabel() // 자기소개 내용
    
    private let strengthTitleLabel = UILabel() // 나의 장점 섹션 제목
    private let strengthStackView = UIStackView() // 키워드와 아이콘
    
    private let collaborationTitleLabel = UILabel() // 스타일 협업 섹션 제목
    private let collaborationContentLabel = UILabel() // 스타일 협업 내용
    
    private let blogButton = UIButton(type: .system) // 블로그 버튼
    private let gitHubButton = UIButton(type: .system) // GitHub 버튼
    
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupStyle()
        
        nameLabel.text = "서광용"
        mbtiLabel.text = "MBTI: INFJ"
        introContentLabel.text = """
            안녕하세요, 기록하고 정리하여 공유하는 것을 
            좋아하는 예비 iOS 개발자 서광용입니다!
            """
        collaborationContentLabel.text = "대화를 통해 협업을 맞춰가는 방식을 좋아하며, 서로의 스타일을 존중하려고 노력합니다."
        
        blogButton.addTarget(self, action: #selector(blogButtonTapped), for: .touchUpInside)
        gitHubButton.addTarget(self, action: #selector(gitHubButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Layout
    private func setupLayout() {
        setupScrollViewLayout()
        setupCardViewLayout()
        setupNameLayout()
        setupIntroLayout()
        setupStrengthLayout()
        setupCollaborationLayout()
        setupBlogButtonLayout()
        setupGitHubButtonLayout()
    }
    
    // MARK: - 스크롤 뷰 + 콘텐츠 뷰
    private func setupScrollViewLayout() {
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
        contentView.addSubview(cardView) // 하얀색 박스 영역.
        
        cardView.snp.makeConstraints { make in // cardView의 제약 조건
            make.top.equalTo(contentView).offset(32)
            make.leading.trailing.equalTo(contentView).inset(20)
            make.height.greaterThanOrEqualTo(600) // cardView의 임시 최소 높이 600pt (이미지나 콘텐츠가 늘어나면 자동으로 커짐)
        }
    }
    
    // MARK: - 이름/MBTI
    private func setupNameLayout() {
        cardView.addSubview(nameLabel)
        cardView.addSubview(mbtiLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(cardView).offset(24)
            make.leading.equalTo(cardView).offset(16)
        }
        
        mbtiLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(nameLabel)
        }
    }
    
    // MARK: - 자기소개
    private func setupIntroLayout() {
        cardView.addSubview(introTitleLabel)
        cardView.addSubview(introContentLabel)
        
        introTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(mbtiLabel.snp.bottom).offset(24)
            make.leading.trailing.equalTo(cardView).inset(16)
        }
        
        introContentLabel.snp.makeConstraints { make in
            make.top.equalTo(introTitleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(cardView).inset(16)
        }
    }
    
    // MARK: - 나의 장점
    private func setupStrengthLayout() {
        cardView.addSubview(strengthTitleLabel)
        cardView.addSubview(strengthStackView)
        
        strengthTitleLabel.snp.makeConstraints { make in // 나의 장점 title 제약조건
            make.top.equalTo(introContentLabel.snp.bottom).offset(24)
            make.leading.equalTo(cardView).offset(16)
        }
        
        strengthStackView.snp.makeConstraints { make in // 나의 장점 키워드와 아이콘
            make.top.equalTo(strengthTitleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(cardView).inset(16)
            make.height.equalTo(24) // StackView라서 높이 명시
        }
    }
    
    // MARK: - 스타일 협업
    private func setupCollaborationLayout() {
        cardView.addSubview(collaborationTitleLabel)
        cardView.addSubview(collaborationContentLabel)
        
        collaborationTitleLabel.snp.makeConstraints { make in // 스타일 협업 title 제약조건
            make.top.equalTo(strengthStackView.snp.bottom).offset(24)
            make.leading.equalTo(cardView).offset(16)
        }
        
        collaborationContentLabel.snp.makeConstraints { make in // 스타일 협업 내용 제약조건
            make.top.equalTo(collaborationTitleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(cardView).inset(16)
        }
    }
    
    // MARK: - Blog 버튼
    private func setupBlogButtonLayout() {
        cardView.addSubview(blogButton)
        
        blogButton.snp.makeConstraints { make in // 블로그 버튼 제약조건
            make.top.equalTo(collaborationContentLabel.snp.bottom).offset(80)
            make.leading.trailing.equalTo(cardView).inset(16)
            make.height.equalTo(44)
        }
    }
    
    // MARK: - GitHub 버튼
    private func setupGitHubButtonLayout() {
        cardView.addSubview(gitHubButton)
        
        gitHubButton.snp.makeConstraints { make in
            make.top.equalTo(blogButton.snp.bottom).offset(15)
            make.leading.trailing.equalTo(cardView).inset(16)
            make.height.equalTo(44)
        }
    }

    
    
    // MARK: - Style
    private func setupStyle() {
        setupBaseStyle()
        setupCardViewStyle()
        setupNameStyle()
        setupIntroStyle()
        setupStrengthStyle()
        setupCollaborationStyle()
        setupBlogButtonStyle()
        setupGitHubButtonStyle()
    }
    
    private func setupBaseStyle() {
        view.backgroundColor = .introPurple
        scrollView.backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    private func setupCardViewStyle() {
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 16
        cardView.layer.masksToBounds = true // 자식 뷰가 둥근 테두리 밖으로 빠져나가면 잘라서 보이지 않도록 함
    }
    
    private func setupNameStyle() {
        nameLabel.font = UIFont(name: "IBMPlexSansKR-Bold", size: 25)
        nameLabel.textColor = .label
        
        mbtiLabel.font = UIFont(name: "NunitoSans-VariableFont_YTLC", size: 17)
        mbtiLabel.textColor = .secondaryLabel // 부재 설명 라벨 색
    }
    
    private func setupIntroStyle() {
        introTitleLabel.text = "자기소개"
        introTitleLabel.font = UIFont(name: "IBMPlexSansKR-Bold", size: 17)
        introTitleLabel.textColor = .label
        
        introContentLabel.font = UIFont(name: "IBMPlexSansKR-Regular", size: 15)
        introContentLabel.textColor = .darkGray
        introContentLabel.numberOfLines = 0 // 줄 수 제한 없앰
        introContentLabel.lineBreakMode = .byWordWrapping // 단어 단위로 자연스럽게 줄 바꿈
    }
    
    private func setupStrengthStyle() {
        strengthTitleLabel.text = "나의 장점"
        strengthTitleLabel.font = UIFont(name: "IBMPlexSansKR-Bold", size: 17)
        strengthTitleLabel.textColor = .label
        
        strengthStackView.axis = .horizontal // horizontal(수평 방향)
        strengthStackView.spacing = 8 // 뷰 사이의 인덱싱(공간)
        strengthStackView.distribution = .equalSpacing // 서로 사이의 간격을 동일하게 배분함
        
        let strength1 = makeIconLabel(text: "💎 성실함")
        let strength2 = makeIconLabel(text: "📋 꼼꼼함")
        let strength3 = makeIconLabel(text: "📚 지식 공유")
        
        [strength1, strength2, strength3].forEach { strengthStackView.addArrangedSubview($0) }
        // addArrangedSubview: addSubView에서, StackView가 직접 위치와 크기를 자동으로 정렬
    }
    
    private func setupCollaborationStyle() {
        collaborationTitleLabel.text = "스타일 협업"
        collaborationTitleLabel.font = UIFont(name: "IBMPlexSansKR-Bold", size: 17)
        collaborationTitleLabel.textColor = .label
        

        collaborationContentLabel.font = UIFont(name: "IBMPlexSansKR-Regular", size: 15)
        collaborationContentLabel.textColor = .darkGray
        collaborationContentLabel.numberOfLines = 0
        collaborationContentLabel.lineBreakMode = .byWordWrapping
    }
    
    private func setupBlogButtonStyle() {
        blogButton.setTitle("블로그 보러가기", for: .normal)
        blogButton.setTitleColor(.white, for: .normal)
        blogButton.backgroundColor = .systemPurple
        blogButton.titleLabel?.font = UIFont(name: "IBMPlexSansKR-Medium", size: 15)
        blogButton.layer.cornerRadius = 8
    }
    
    private func setupGitHubButtonStyle() {
        gitHubButton.setTitle("깃허브 보러가기", for: .normal) // .normal: 기본 상태(아무것도 안하고 있는)
        gitHubButton.setTitleColor(.white, for: .normal)
        gitHubButton.backgroundColor = .systemPurple
        gitHubButton.titleLabel?.font = UIFont(name: "IBMPlexSansKR-Medium", size: 15)
        gitHubButton.layer.cornerRadius = 8
    }
    
    private func makeIconLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "IBMPlexSansKR-Regular", size: 15)
        label.textColor = .darkGray
        label.text = text
        return label
    }
    
    // MARK: - BlogButtonAction
    @objc private func blogButtonTapped() {
        guard let url = URL(string: "https://jud00.tistory.com/") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil) // url 열기
    }
    
    // MARK: - GitHubButtonAction
    @objc private func gitHubButtonTapped() {
        guard let url = URL(string: "https://github.com/Gwangyong") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
