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
    
    private let member: Member
    private let backButton = UIButton()
    private let nameLabel = UILabel()
    private let tistoryButton = UIButton()
    private let introContainerView = UIView()
    private let introLabel = UILabel()
    private let moreLabel = UILabel()
    private let tableView = UITableView()
    private var allMessages: [Message] = []
    private var messages: [Message] = []
    private var hasAnimated: Bool = false
    
    init(member: Member) {
            self.member = member
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMessageData()
        setupUI()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        animateMessagesOneByOne()

        // 애니메이션이 한 번만 실행되도록
        if !hasAnimated {
            startMessageAnimation()
            hasAnimated = true
        }
    }
    
    
    private func setupMessageData() {
        allMessages = [
            Message(text: "지영의 장점은?", type: .question),
            Message(text: member.strength, type: .answer),
            Message(text: "협업할땐 어떤 스타일이야?", type: .question),
            Message(text: member.collaborationStyle, type: .answer)
        ]
        
        messages = []
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.backgroundRed
        
        view.addSubview(backButton)
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(44)
        }
        
        view.addSubview(nameLabel)
        nameLabel.text = member.name
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
        introLabel.text = member.description
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
    
    // 메시지를 하나씩 추가하면서 애니메이션
    private func startMessageAnimation() {
        for (index, message) in allMessages.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.8) {
                self.addMessage(message)
            }
        }
    }
    
    private func addMessage(_ message: Message) {
        messages.append(message)
        
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        
        // 테이블뷰에 새 셀 추가
        tableView.insertRows(at: [indexPath], with: .none)
        tableView.layoutIfNeeded()
        
        // 새로 추가된 셀에 애니메이션 적용
        DispatchQueue.main.async {
            if let cell = self.tableView.cellForRow(at: indexPath) {
                // 초기 상태: 아래에서 시작
                cell.transform = CGAffineTransform(translationX: 0, y: 50)
                cell.alpha = 0
                
                // 애니메이션으로 원래 위치로
                UIView.animate(
                    withDuration: 0.5,
                    delay: 0,
                    usingSpringWithDamping: 0.8,
                    initialSpringVelocity: 0.8,
                    options: .curveEaseOut,
                    animations: {
                        cell.transform = .identity
                        cell.alpha = 1.0
                    }
                )
            }
        }
    }
    
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func blogButtonTapped() {
        guard let url = URL(string: member.blogURL) else { return }

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
            cell.configure(with: message.text, profileImage: UIImage(named: member.profileImage))
            return cell
        }
    }
}
