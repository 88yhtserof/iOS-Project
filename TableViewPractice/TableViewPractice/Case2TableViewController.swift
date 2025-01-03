//
//  Case2TableViewController.swift
//  TableViewPractice
//
//  Created by 임윤휘 on 1/2/25.
//

import UIKit

class Case2TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: -  TableViewDelegate
extension Case2TableViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Setting.Header(rawValue: section) else {
            print("Unknown Section")
            return nil
        }
        return section.title
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Setting.Header.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting.samples[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "case-2-identifier") else { return UITableViewCell() }
        
        cell.textLabel?.text = Setting.samples[indexPath.section][indexPath.row].title
        return cell
    }
}


struct Setting {
    enum Header: Int, CaseIterable {
        case full, personal, others
        
        var title: String {
            switch self {
            case .full:
                return "전체 설정"
            case .personal:
                return "개인 설정"
            case .others:
                return "기타"
            }
        }
    }
    
    let header: Header
    let title: String
    
    static let samples = [ [Setting(header: .full, title: "공지사항"),
                           Setting(header: .full, title: "실험실"),
                           Setting(header: .full, title: "버전 정보")],
                           
                           [Setting(header: .personal, title: "개인/보안"),
                           Setting(header: .personal, title: "알림"),
                           Setting(header: .personal, title: "채팅"),
                           Setting(header: .personal, title: "멀티프로필")],
                           
                           [Setting(header: .others, title: "고객센터/도움말")]]
}

/*
 <왜 이렇게 코딩했나 생각해보기>
 1. 왜 구조체로 했나요?
 사용 이유에 앞서 클래스와 구조체를 비교해보겠습니다.
 클래스는 참조 타입으로, 힙 메모리에 인스턴스가 생성되어 프로퍼티에서 해당 인스턴스를 가리키는 형태로 데이터가 사용됩니다. 가리키고 있는 변수/상수만 있다면 메모리 상에서 오래 유지됩니다. 따라서 상태를 유지할 필요가 있을 때 사용됩니다. 더불어 상속 구조가 가능하기 때문에 부모의 멤버(기능)을 이어 받고 확장할 필요가 있다면 클래스를 사용해야 합니다.
  이와는 반대로 구조체는 값 타입으로, 스택 메모리에 인스턴스가 생성되어 값이 복사되어 저장되는 형태로 데이터가 사용됩니다. 해당하는 영역의 작업이 끝나면 스택 프레임은 제거되는데, 이와 함께 스택에 생성된 구조체의 인스턴스도 함께 제거됩니다. 따라서 클래스에 비해 인스턴스가 빠르게 생성되고 따로 인스턴스를 관리해주지 않아도 되지만 오래 지속하며 상태를 확인할 수 없습니다.
  Setting 구조체의 경우 구조체가 적합하다고 생각합니다. 왜냐하면 Setting은 설정 화면의 데이터 목록의 아이템을 구성하기 위한 구조로, 인스턴스를 유지해서 오래 상태를 확인할 필요가 없습니다. 더해 상속을 통해 기능을 확장할 필요가 없습니다. 결과적으로 Setting은 생성이 빠르고 생명주기를 관리할 필요가 없는 구조체가 적합합니다.
 
 2. 왜 열거형을 사용했나요?
  헤더의 종류는 3가지로 고정적입니다. 그리고 각 헤더에 따른 소분류의 항목들이 존재합니다. 따라서 각 헤더는 구분이 확실해야하며 이러한 구분은 기능 구현 때 자주 사용되어 구현이 간편해야합니다. 기능 구현 때마다 String을 비교해 일치하는 헤더를 찾아 해당하는 항목을 기입할 수도 있지만, 이러한 방식은 오탈자를 주의해야하는 문제가 있습니다. 따라서 switch문과 함께 사용해서 분기처리를 효율적으로 할 수 있는 열거형을 사용했습니다.
 
 3. 왜 원시값 타입으로 String이 아닌 Int를 사용했나요? 그리고 왜 String을 title이라는 프로퍼티로 따로 구분해 사용하나요?
 목적이 명확한 변수/상수명은 코드의 가독성을 높이고 협업 시 코드의 이해도 향상에 도움이 된다고 생각합니다. 따라서 명시적인 코드를 작성하기 위해 노력하고 있습니다. 이와 같은 이유로 열거형의 원시값 타입은 Int로 사용했으며, title 프로퍼티를 생성했습니다. 먼저 열거형의 원시값을 Int 타입으로 선언하면, 열거형 인스턴스 생성 시 rawValue로 Int값을 넣을 수 있게 되며 case 선언의 순서대로 해당하는 case를 가진 인스턴스를 생성할 수 있습니다. 이 방식을 활용할 경우, table view의 section 별 다른 작업을 수행해야할 때 switch문과 함께 사용하면 명시적인 분기 처리를 할 수 있습니다. 더불어 title 프로퍼티의 경우 원시값을 String으로 해 rawValue 프로퍼티로 사용해도 되지만 그 rawValue가 무엇을 담은 프로퍼티인지 명확하지 않다고 생각해 title이라는 프로퍼티를 따로 생성해 그 사용 의미를 명확히 하고자 했습니다.
 
 4. 왜 CaseIterable을 사용했나요?
 numberOfSections에서 section의 개수를 전달해야하는데, 따로 값을 전달하면 이후 section 추가 또는 제거 시 수정할 부분이 많아지게 때문에 효율적인 수정을 위해 Header에 CaseIterable를 채택해 배열로 Header를 사용할 수 있도록 구현했습니다.
 
 5. 왜 samples 데이터 목록을 Setting에 두었나요?
 해당 화면은 설정화면으로, 데이터 변경이 일어나지 않습니다. 따라서 앞으로 변경될 가능성이 없기 때문에 view controller에 두지 않고 타입에 두었고 모든 인스턴스에서도 해당 samples가 동일할 것이기 때문에 static 키워드를 사용해 타입 프로퍼티로 만들었습니다.
 
 <정리>
 Setting 구조는 table view의 아이템을 위한 데이터 구조입니다. 따라서 기능 확장을 위한 상속과 지속적인 상태 확인 작업이 필요하지 않습니다. 그래서 클래스와 비교해 인스턴스화가 빠르고 생명주기를 관리하지 않아도 되기에 구조체가 적합하다고 생각했습니다.
 설정 화면에서 사용되는 대분류인 header는 아래 소분류를 가지고 있어 section 별로 해당하는 항목을 찾아 데이터를 삽입해야합니다. 따라서 명확하고 효율적인 분기 처리를 위해 열거형을 사용했습니다.
 또한 모든 대분류에는 '전체 설정'과 같이 제목을 가지고 있는데, title 연산 프로퍼티를 사용해 명시적으로 사용하고자 했습니다.
 그리고 이후 대분류의 추가/제거 시 데이터 수정을 용이하게 하기 위해, CaseIterable을 채택해 Header의 모든 case를 배열로 받아 section 구성 시 사용했습니다.
 마지막으로 설정 화면에 사용되는 데이터 목록은 고정되어있고, 어떤 Header 인스턴스에서도 데이터는 변경되지 않을 것이기 때문에 Header 타입에 타입 프로퍼티로 samples 저장 프로퍼티를 만들어 사용했습니다.
*/
