//
//  SettingViewController.swift
//  ThirdProject
//
//  Created by 임윤휘 on 1/10/25.
//

import UIKit

struct Setting {
    static let friendsLike = "star"
    static let productLike = "star"
}

// 멤버와 값의 분리 => raw value 사용
// CaseIterable => 배열로 표현해줄 수 있음
enum SettingOptions: Int, CaseIterable {
    case total // 0
    case personal // 100
    case others // 101
    
    var mainOption: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
    
    var subOption: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}

class SettingViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    // 열거형을 통해 리터럴한 문자 숨기기
    let sectionList: [SettingOptions] = SettingOptions.allCases
    let rowList1 = ["공지사항", "실험실", "버전 정보"]
    let rowList2 = ["개인/보안", "알림", "채팅"]
    let rowList3 = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(SettingOptions.allCases[1].rawValue)
        print(SettingOptions.total)
        print(SettingOptions.allCases[0].subOption)
        print(SettingOptions.total.subOption)
        // 열거형의 멤버
        print(SettingOptions.personal)
        // 열거형에서 rawValue
        print(SettingOptions.personal.rawValue)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].mainOption
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptions.allCases[section].subOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].subOption[indexPath.row]
        
        return cell
    }
}
