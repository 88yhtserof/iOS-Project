//
//  BasicTableViewController.swift
//  SecondApp
//
//  Created by 임윤휘 on 1/2/25.
//

import UIKit

class BasicTableViewController: UITableViewController {
    
    var list = [ "프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트프로젝트", "메인 업무메인 업무메인 업무메인 업무메인 업무메인 업무메인 업무메인 업무메인 업무메인 업무메인 업무메인 업무", "새싹 과제" ] {
        didSet {
            tableView.reloadData()
        }
    }
    let randomTexts = [ "장보기", "밥 먹기", "영화 보기", "축구하기", "명상하기" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewBackground()
        
        tableView.rowHeight = UITableView.automaticDimension
        // label의 numberOfLines 수정
        
        
        // var monster = Monster() // 인스턴스를 만들다, 인스턴스화하다
    }
    
    @IBAction func randomTextTapped(_ sender: UIBarButtonItem) {
        // 데이터를 기반으로 뷰를 그리자
        let text = randomTexts.randomElement()!
        list.append(text) // 데이터를 업데이트하고
//        tableView.reloadData() // 뷰도 업데이트 하자 - 처음부터 다시 그린다
    }
    
    // 1. 셀 개수
    // 선택적 메서드
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        
//    }
    
    // 필수: numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // 2. 셀 디자인 및 데이터 처리: cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "first-cell-identifier")!
        
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.setPrimaryLabel("\(indexPath.row) 번째 아이템")
        
        
        // cell은 재사용되기 때문에 모든 경우의 수에 대해 대응하지 않으면 UI 오류가 발생할 수 있다
        // 재사용 메커니즘
        if indexPath.row.isMultiple(of: 2) {
            cell.backgroundColor = .lightGray
        } else {
            cell.backgroundColor = .white
            cell.textLabel?.text?.append("🎈")
        }
        
        cell.textLabel?.textColor = .purple
        cell.textLabel?.font = .systemFont(ofSize: 30)
        
        return cell
    }
    
    // 옵션: 셀 클릭
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
        list.remove(at: indexPath.row)
    }
    
    // 3. 셀 높이: heightForRowAt
    // cell 높이가 유동적이다. 그럴 때 사용한다
    // 만약 높이가 고정적이라면, tableView.rowHeight = 90 처럼 고정
    // 왜냐하면 높이가 고정적인데 설정 메서드가 매번 호출되는 것은 비효율적이다
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
}
