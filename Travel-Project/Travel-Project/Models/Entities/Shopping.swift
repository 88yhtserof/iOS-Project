//
//  Shopping.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/5/25.
//

import Foundation

struct Shopping {
    let title: String
    var check: Bool
    var bookmark:Bool
    
    init(title: String, check: Bool, bookmark: Bool) {
        self.title = title
        self.check = check
        self.bookmark = bookmark
    }
    
    init(title: String) {
        self.init(title: title, check: false, bookmark: false)
    }
    
    static let samples = [ Shopping(title: "아이폰 구매", check: true, bookmark: true),
                           Shopping(title: "맥북 구매", check: false, bookmark: false),
                           Shopping(title: "아이패드 미니 구매", check: false, bookmark: true)]
}
