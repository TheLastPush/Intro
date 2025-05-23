//
//  ChattingTableView.swift
//  theLastPush
//
//  Created by 지영 on 5/22/25.
//

import UIKit

class ChattingTableView: UIView {
    
    private let tableView = UITableView()
    private let member: Member
    private var allMessages: [Message] = []
    private var messages: [Message] = []
    private var hasAnimated: Bool = false
    
    init(member: Member) {
        self.member = member
        super.init(frame: .zero)
        setupMessageData()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame = bounds
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
    
    private func setupTableView() {
        addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(QuestionCell.self, forCellReuseIdentifier: QuestionCell.reuseIdentifier)
        tableView.register(AnswerCell.self, forCellReuseIdentifier: AnswerCell.reuseIdentifier)
    }
    
    func startMessageAnimation() {
        for (index, message) in allMessages.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.8) {
                self.addMessage(message)
            }
        }
    }
    
    private func addMessage(_ message: Message) {
        messages.append(message)
        
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        
        tableView.insertRows(at: [indexPath], with: .none)
        tableView.layoutIfNeeded()
        
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
}

extension ChattingTableView: UITableViewDataSource {
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

extension ChattingTableView: UITableViewDelegate {
}
