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

    // MARK: - viewDidLoad()
    override func viewDidLoad() {
      super.viewDidLoad()
      setupLayout()
      setupStyle()
    }

    // MARK: - Layout
    private func setupLayout() {
      view.addSubview(scrollView)
      scrollView.addSubview(contentView)
      contentView.addSubview(cardView) // 하얀색 박스 영역.

      scrollView.snp.makeConstraints { make in // scrollView의 제약 조건
        make.edges.equalToSuperview()
      }

      contentView.snp.makeConstraints { make in // contentView의 제약 조건
        make.edges.equalToSuperview()
        make.width.equalToSuperview()
        make.height.equalTo(1000) // 임시 높이 부여
      }

      cardView.snp.makeConstraints { make in // cardView의 제약 조건
        make.top.equalTo(contentView).offset(32)
        make.leading.equalTo(contentView).offset(20)
        make.trailing.equalTo(contentView).inset(20)
        make.height.greaterThanOrEqualTo(600) // cardView의 임시 최소 높이 600pt (이미지나 콘텐츠가 늘어나면 자동으로 커짐)
      }
    }

    // MARK: - Style
    private func setupStyle() {
      view.backgroundColor = .systemGroupedBackground // 연한 회색 배경
      scrollView.backgroundColor = .clear
      contentView.backgroundColor = .clear

      cardView.backgroundColor = .white
      cardView.layer.cornerRadius = 16
      cardView.layer.masksToBounds = true // 자식 뷰가 둥근 테두리 밖으로 빠져나가면 잘라서 보이지 않도록 함
    }
}
