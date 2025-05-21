//
//  MilouVC.swift
//  theLastPush
//
//  Created by 지영 on 5/21/25.
//

import UIKit
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
            description: "자기소개 내용입니다. 내 장점은 모르는 걸 끝까지 파고드는 집요함과 결국 해내는 끈기가 있어. 팀의 흐름을 가장 먼저 생각하고, 기획자와 디자이너와도 적극적으로 소통하려고 노력해",
            strength: "내 장점은 모르는 걸 끝까지 파고드는 집요함과 결국 해내는 끈기가 있어",
            collaborationStyle: "팀의 흐름을 가장 먼저 생각하고, 기획자와 디자이너와도 적극적으로 소통하려고 노력해",
            blogURL: "https://blog.example.com",
            backgroundColor: .introRed
        )
    }()
    
    private let nameLabel = UILabel()
    private let introContainerView = UIView()
    private let introLabel = UILabel()
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
        
        view.addSubview(nameLabel)
        nameLabel.text = milou.name
        nameLabel.font = UIFont.ibmPlexSansKR(size: 32, weight: .black)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(introContainerView)
        introContainerView.backgroundColor = .white
        introContainerView.layer.cornerRadius = 10
        introContainerView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        // 자기소개 레이블
        introContainerView.addSubview(introLabel)
        introLabel.text = milou.description
        introLabel.font =  UIFont.ibmPlexSansKR(size: 16)
        introLabel.numberOfLines = 0
        introLabel.textColor = .darkGray
        introLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16))
        }
        
        // 테이블뷰는 introContainerView 아래에 배치
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(introContainerView.snp.bottom).offset(24)
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
