//
//  Search.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/7/25.
//

import Foundation

/*
 <질문>
 검색 관련한 작업을 한 곳에 묶어 코드 수정이 용이하게 하고, VC에서는 간결하게 결과값만 받아 작업하고자 Search 구조체를 만들었습니다.
 근데 이렇게 구현하면 CityInfoTableViewController의 search() 메서드가 호출될 때마다 인스턴스가 만들어지게 되는데,
 매 메서드 호출 때마다 인스턴스가 만들어지는 것보다는 VC 내에서 메서드를 통해 작업을 구현하는 것이 좋았을까요?
 */
struct Search {
    let word: String
    var caseInsensitiveWord: String {
        word.lowercased()
    }
    
    // 실패 가능 생성자를 사용해서 빈 문자열일 경우 nil 반환하기
    init?(searchedWord word: String) {
        guard !word.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return nil }
        self.word = word
    }
    
    func contains(within list: [String]) -> Bool {
        for word in list {
            if word.lowercased().contains(caseInsensitiveWord) {
                return true
            }
        }
        return false
    }
    
    func matches(within list: [String]) -> [NSRange] {
        return list
            .map{
                let text = $0.lowercased()
                return (text as NSString).range(of: caseInsensitiveWord)
            }
    }
}
