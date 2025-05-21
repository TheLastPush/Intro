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
            description: "자기소개 내용입니다.",
            strength: "내 장점은 모르는 걸 끝까지 파고드는 집요함과, 흐름력도 결국 해내는 끈기가 있어",
            collaborationStyle: "팀의 흐름을 가장 먼저 생각하고, 기획자와 디자이너와도 적극적으로 소통하려고 노력해",
            blogURL: "https://blog.example.com",
            backgroundColor: .introRed
        )
    }()
    
    private var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMessageData()
        
    }
    
    
    private func setupMessageData() {
        messages = [
            Message(text: "지영의 장점은?", type: .question),
            Message(text: milou.strength, type: .answer),
            Message(text: "협업할땐 어떤 스타일이야?", type: .question),
            Message(text: milou.collaborationStyle, type: .answer)
        ]
    }
    
}
