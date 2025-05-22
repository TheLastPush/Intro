//
//  Message.swift
//  theLastPush
//
//  Created by 지영 on 5/22/25.
//

import Foundation

enum MessageType {
    case question
    case answer
}

struct Message {
    let text: String
    let type: MessageType
}
