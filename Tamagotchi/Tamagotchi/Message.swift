//
//  Message.swift
//  Tamagotchi
//
//  Created by 임윤휘 on 1/2/25.
//

import Foundation


// TamagotchiInfo 구조체에 함께 넣을까 했지만 messageFormats은 Codable 하지 않아도 되고, 메시지라는 다른 목적을 가지고 있기 때문에 다른 구조체로 분리했음
struct Massage {
    static private var messageFormats = [ "%@님, 오늘도 화이팅!",
                                          "반가워요, %@님!",
                                          "%@님이 있어 힘이 나요!",
                                          "나는 %@님의 비타민!"]
    
    /// Return random message with a given string.
    static func makeRandomMessage(_ str: String) -> String {
        let format = messageFormats.randomElement()!
        return String(format:format, str)
    }
}
