//
//  MilouVC.swift
//  theLastPush
//
//  Created by 지영 on 5/21/25.
//

import UIKit
import SafariServices
import SnapKit

enum MessageType {
    case question
    case answer
}

struct Message {
    let text: String
    let type: MessageType
}

class MilouVC: UIViewController {
    
    // 멤버 정보 (임시 데이터)
    private var milou: Member = {
        return Member(
            name: "양지영",
            profileImage: "member4",
            mbti: "ENFP",
            description: "안녕하세요!\n맥도날드🍔를 가장 좋아하는 양지영입니다.\n저는 혼자보다 함께👯 성장하고 만들어나가는걸 좋아하는 주니어 iOS 개발자예요.",
            strength: "내 장점은 모르는 걸 끝까지 파고드는 집요함과 결국 해내는 끈기가 있어",
            collaborationStyle: "팀의 흐름을 가장 먼저 생각하고, 기획자와 디자이너와도 적극적으로 소통하려고 노력해",
            blogURL: "https://milouthedev.tistory.com",
            backgroundColor: .introRed
        )
    }()
    
    private let backButton = UIButton()
    private let nameLabel = UILabel()
    private let tistoryButton = UIButton()
    private let introContainerView = UIView()
    private let introLabel = UILabel()
    private let moreLabel = UILabel()
    private let tableView = UITableView()
    private var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMessageData()
        setupUI()
        setupTableView()
    }
    
    
    private func setupMessageData() {
        messages = [
            Message(text: "지영의 장점은?", type: .question),
            Message(text: milou.strength, type: .answer),
            Message(text: "협업할땐 어떤 스타일이야?", type: .question),
            Message(text: milou.collaborationStyle, type: .answer)
        ]
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.backgroundRed
        
        view.addSubview(backButton)
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.tintColor = .black
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(24)
        }
        
        view.addSubview(nameLabel)
        nameLabel.text = milou.name
        nameLabel.font = UIFont.ibmPlexSansKR(size: 32, weight: .black)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(20)
        }
        
        
        view.addSubview(tistoryButton)
        tistoryButton.setImage(UIImage(named: "tistory"), for: .normal)
        tistoryButton.tintColor = .systemRed
        tistoryButton.addTarget(self, action: #selector(blogButtonTapped), for: .touchUpInside)
        tistoryButton.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(16)
            $0.width.height.equalTo(40)
        }
        
        
        view.addSubview(introContainerView)
        introContainerView.backgroundColor = .white
        introContainerView.layer.cornerRadius = 10
        introContainerView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        introContainerView.addSubview(introLabel)
        introLabel.text = milou.description
        introLabel.font =  UIFont.ibmPlexSansKR(size: 16)
        introLabel.numberOfLines = 0
        introLabel.textColor = .darkGray
        introLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16))
        }
        
        view.addSubview(moreLabel)
        moreLabel.text = "🔎 더 알아보기"
        moreLabel.font = UIFont.ibmPlexSansKR(size: 18, weight: .bold)
        moreLabel.snp.makeConstraints {
            $0.top.equalTo(introContainerView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(20)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(moreLabel.snp.bottom).offset(16)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(QuestionCell.self, forCellReuseIdentifier: QuestionCell.reuseIdentifier)
        tableView.register(AnswerCell.self, forCellReuseIdentifier: AnswerCell.reuseIdentifier)
        
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func blogButtonTapped() {
        guard let url = URL(string: milou.blogURL) else { return }

        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .popover
        safariVC.dismissButtonStyle = .close
        present(safariVC, animated: true, completion: nil)
    }

}

extension MilouVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        switch message.type {
        case .question:
            let cell = tableView.dequeueReusableCell(withIdentifier: QuestionCell.reuseIdentifier, for: indexPath) as! QuestionCell
            cell.configure(with: message.text)
            return cell
            
        case .answer:
            let cell = tableView.dequeueReusableCell(withIdentifier: AnswerCell.reuseIdentifier, for: indexPath) as! AnswerCell
            cell.configure(with: message.text, profileImage: UIImage(named: milou.profileImage))
            return cell
        }
    }
}
