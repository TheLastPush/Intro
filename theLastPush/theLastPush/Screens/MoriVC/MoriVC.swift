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
    
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupStyle()
        
        // 더미 데이터
        nameLabel.text = "서광용"
        mbtiLabel.text = "MBTI: INFJ"
        introTitleLabel.text = "자기소개"
        introContentLabel.text = """
            안녕하세요, 기록하고 정리하여 공유하는 것을 
            좋아하는 예비 iOS 개발자 서광용입니다!
            """ // 더미 데이터
    }
    
    // MARK: - Layout
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(cardView) // 하얀색 박스 영역.
        
        cardView.addSubview(nameLabel)
        cardView.addSubview(mbtiLabel)
        cardView.addSubview(introTitleLabel)
        cardView.addSubview(introContentLabel)
        
        scrollView.snp.makeConstraints { make in // scrollView의 제약 조건
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in // contentView의 제약 조건
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.greaterThanOrEqualToSuperview() // 최소 높이 제약 추가
        }
        
        cardView.snp.makeConstraints { make in // cardView의 제약 조건
            make.top.equalTo(contentView).offset(32)
            make.leading.trailing.equalTo(contentView).inset(20)
            make.height.greaterThanOrEqualTo(600) // cardView의 임시 최소 높이 600pt (이미지나 콘텐츠가 늘어나면 자동으로 커짐)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(cardView).offset(24)
            make.leading.equalTo(cardView).offset(16)
        }
        
        mbtiLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(nameLabel)
        }
        
         introTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(mbtiLabel.snp.bottom).offset(24)
            make.leading.trailing.equalTo(cardView).inset(16)
        }
        
        introContentLabel.snp.makeConstraints { make in
            make.top.equalTo(introTitleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(cardView).inset(16)
        }
        
        cardView.addSubview(strengthTitleLabel)
        cardView.addSubview(strengthStackView)
        cardView.addSubview(collaborationTitleLabel)
        cardView.addSubview(collaborationContentLabel)
        
        strengthTitleLabel.snp.makeConstraints { make in // 나의 장점 title 제약조건
            make.top.equalTo(introContentLabel.snp.bottom).offset(24)
            make.leading.equalTo(cardView).offset(16)
        }
        
        strengthStackView.snp.makeConstraints { make in // 나의 장점 키워드와 아이콘
            make.top.equalTo(strengthTitleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(cardView).inset(16)
            make.height.equalTo(24) // StackView라서 높이 명시
        }
        
        collaborationTitleLabel.snp.makeConstraints { make in // 스타일 협업 title 제약조건
            make.top.equalTo(strengthStackView.snp.bottom).offset(24)
            make.leading.equalTo(cardView).offset(16)
        }
        
        collaborationContentLabel.snp.makeConstraints { make in // 스타일 협업 내용 제약조건
            make.top.equalTo(collaborationTitleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(cardView).inset(16)
        }
        
    }
    
    
    // MARK: - Style
    private func setupStyle() {
        view.backgroundColor = .introPurple
        scrollView.backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 16
        cardView.layer.masksToBounds = true // 자식 뷰가 둥근 테두리 밖으로 빠져나가면 잘라서 보이지 않도록 함
        
        nameLabel.font = UIFont(name: "IBMPlexSansKR-Bold", size: 25)
        nameLabel.textColor = .label
        
        mbtiLabel.font = UIFont(name: "NunitoSans-VariableFont_YTLC", size: 17)
        mbtiLabel.textColor = .secondaryLabel // 부재 설명 라벨 색
        
        introTitleLabel.font = UIFont(name: "IBMPlexSansKR-Bold", size: 17)
        introTitleLabel.textColor = .label
        
        introContentLabel.font = UIFont(name: "IBMPlexSansKR-Regular", size: 12)
        introContentLabel.textColor = .darkGray
        introContentLabel.numberOfLines = 0 // 줄 수 제한 없앰
        introContentLabel.lineBreakMode = .byWordWrapping // 단어 단위로 자연스럽게 줄 바꿈
        
        
        strengthTitleLabel.text = "나의 장점"
        strengthTitleLabel.font = UIFont(name: "IBMPlexSansKR-Bold", size: 17)
        strengthTitleLabel.textColor = .label
        
        strengthStackView.axis = .horizontal // horizontal(수평 방향)
        strengthStackView.spacing = 8 // 뷰 사이의 인덱싱(공간)
        strengthStackView.distribution = .equalSpacing // 서로 사이의 간격을 동일하게 배분함
        
        let strength1 = makeIconLabel(text: "💎 성실함")
        let strength2 = makeIconLabel(text: "📋 꼼꼼함")
        let strength3 = makeIconLabel(text: "📚 지식 공유")
        [strength1, strength2, strength3].forEach { strengthStackView.addArrangedSubview($0)}
        // addArrangedSubview: addSubView에서, StackView가 직접 위치와 크기를 자동으로 정렬
        
        collaborationTitleLabel.text = "스타일 협업"
        collaborationTitleLabel.font = UIFont(name: "IBMPlexSansKR-Bold", size: 17)
        collaborationTitleLabel.textColor = .label
        
        collaborationContentLabel.text = "대화를 통해 협업을 맞춰가는 방식을 좋아하며, 서로의 스타일을 존중하려고 노력합니다."
        collaborationContentLabel.font = UIFont(name: "IBMPlexSansKR-Regular", size: 12)
        collaborationContentLabel.textColor = .darkGray
        collaborationContentLabel.numberOfLines = 0
        collaborationContentLabel.lineBreakMode = .byWordWrapping

    }
    
    private func makeIconLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "IBMPlexSansKR-Regular", size: 12)
        label.textColor = .darkGray
        label.text = text
        return label
    }
}
