//
//  UserTableViewController.swift
//  SecondApp
//
//  Created by 임윤휘 on 1/3/25.
//

import UIKit

struct Friend {
    let name: String
    let message: String
    let profile_image: String
}

class UserTableViewController: UITableViewController {
    
    var friends = FriendsInfo().list
    
    let name = ["고래밥", "칙촉", "카스타드"]
    let message = ["고래밥 냠냠", "행복한 하루", "배고파"]
    let profile = [ "star", "pencil", "star.fill" ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // xib 파일을 사용할 때는 해당 cell을 table view에 등록하는 과정이 필요하다
//        let nib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "no-profile-tableview-cell")
        
        
        
        navigationItem.title = "title"
        
        let star = UIImage(systemName: "star")
        let right = UIBarButtonItem(image: star, style: .plain, target: self, action: #selector(rightBarButtonItemDidTapped))
        navigationItem.rightBarButtonItem = right
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // UserTableViewCell의 인스턴스 생성
        let cell = tableView.dequeueReusableCell(withIdentifier: "user-cell-identifier", for: indexPath) as! UserTableViewCell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "no-profile-tableview-cell") as! NoProfileTableViewCell
        
        let friend = friends[indexPath.row]
        
        // cellForRow를 줄여보자
        // cell에 있는 객체를 vc에서 가져와 수정하고 있다.
        // cell의 책임인 UI 수정은 cell에서 구현하자
        // UI 요소만 분리하자
        
        /*
         private가 아닌 접근제어자를 가진 멤버들은 사용하지 않더라도 부를 수 있다는 가능성을 내포하고 있기 때문에 파일 간 연결 망을 가지고 있다. 부를 가능성이 없는 멤버는 접근제어자를 사용해서 사용 범위를 제어해주면 약간의 효율성이 올라간다.
         -> 최적화 / 협업 시 멤버의 사용범위를 추측할 수 있다
         */
        cell.configureData(friend: friend)
        
        // cell이 cell로서 역할이 아니라 table view의 정보를 너무 많이 갖기 때문에 버튼 기능은 vc에게 맡기기
        // vc의 역할과 view의 역할 구분하기
        // 버튼을 구분 짓기 위해 tag로 분류
        cell.likeButton.tag = indexPath.row
        // Function Types 함수는 일급 객체
        cell.likeButton.addTarget(self, action: #selector(likeButtonDidTapped), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. 스토리보드 특정: 어떤 스토리보드에서 어떤 VC을 가져올 건지
        let sb = UIStoryboard(name: "User", bundle: nil) // 번들: 프로젝트의 하위 파일, nil-> 내 파일 사용
        
        // 2. 전환할 VC 가져오기
        let viewController = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        // (옵션1)어떤 modalPresentationStyle을 지정했냐에 따라 modalTransitionStyle이 적용이 안 되거나 언타임 이슈가 생기는 케이스도 존재
//        viewController.modalPresentationStyle = .fullScreen
        
        // 2. Pass Data - vc가 갖고 있는 프로퍼티에 데이터 추가
        viewController.contents = friends[indexPath.row].name
        
        // (옵션2) present이지만 navigationTitle도 쓰고 싶다면, 다시 navigationController를 임베드해서 present
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        
        // 3. 화면을 전환할 방법 선택
        present(navigationController, animated: true)
//        present(viewController, animated: true)
//        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    @objc
    func rightBarButtonItemDidTapped() {
        // 1. 스토리보드 특정: 어떤 스토리보드에서 어떤 VC을 가져올 건지
        let sb = UIStoryboard(name: "User", bundle: nil) // 번들: 프로젝트의 하위 파일, nil-> 내 파일 사용
        
        // 스토리보드를 얻는 다른 방법: 같은 스토리보드 내에서 전환하는 경우 아래와 같은 방법도 가능
        // self.storyboard?.instantiateViewController(withIdentifier: "GrayViewController")
        
        // 2. 전환할 VC 가져오기
        let viewController = sb.instantiateViewController(withIdentifier: "GrayViewController") as! GrayViewController
        
        // 3. 화면을 전환할 방법 선택
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func likeButtonDidTapped(_ sender: UIButton) {
        // 데이터 기준 판단하고 그 후 뷰를 그리자
        friends[sender.tag].like.toggle()
        let indePath = IndexPath(row: sender.tag, section: 0)
        tableView.reloadRows(at: [indePath], with: .automatic)
    }
}
