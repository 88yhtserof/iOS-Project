//
//  MagazineInfoTableViewCell.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/3/25.
//

import UIKit

class MagazineInfoTableViewCell: UITableViewCell {
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let identifier = "magazine-info-cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        travelImageView.image = UIImage(systemName: "photo")
    }
    
    private func configureSubviews() {
        travelImageView.backgroundColor = .lightGray
        travelImageView.cornerRadius()
        travelImageView.contentMode = .scaleAspectFill
        
        titleLabel.font = .systemFont(ofSize: 23, weight: .heavy)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .black
        
        subtitleLabel.font = .systemFont(ofSize: 18, weight: .regular)
        subtitleLabel.textColor = .gray
        
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
    
    func configure(with magazine: Magazine) {
        let imagStr = magazine.photo_image
        if let url = URL(string: imagStr) {
            travelImageView.kf.setImage(with: url)
        }
        titleLabel.text = magazine.title
        subtitleLabel.text = magazine.subtitle
        dateLabel.text = magazine.date_description
    }
}

/*
 [ 스토리보드의 뷰를 코드로 수정할 때, 어느 시점에 작업을 구현해야 할까 ]
 <공식문서에서 발췌한 부분>
 - 만약 인터페이스 빌더를 사용해 인터페이스를 디자인한다면, 뷰 객체가 nib file로부터 로드될 때 init(frame:) 는 호출되지 않는다. nib file 객체는 재구성된 후 init(coder:) 을 사용해 초기화된다.
 - UIView와 UIViewController의 모든 서브 클래스를 포함한 NSCoding 프로토콜을 준수하는 객체들은 그들의 inirWithCoder: 메서드를 사용해 초기화된다.
 - 모든 객체들이 인스턴스화되고 초기화된 후 nib 로딩 코드는 모든 객체들에 대한 아웃렛과 액션 연결을 재설정한다. 그런후 nib 로딩 코드는 그 객체들의 awakeFromNib 메서드를 호출한다.
 - 일반적으로, awakeFromNib을 구현하는 것은 객체가 디자인 시간에 완료할 수 없는 추가적인 설정이 필요할 때이다.
 
 <정리>
 스토리보드를 사용해 UIView를 디자인하면 init(coder:)를 통해 객체가 초기화됩니다. 그리고 모든 객체들이 초기화된 이후에 nib loading 코드는 모든 객체들에 대한 아웃렛과 액션을 재연결합니다. 따라서 init(coder:)에 configureSubviews()를 호출하게 되면 아래와 같은 오류가 발생합니다. 오류는 아웃렛이 nil이라 강제 옵셔널 바인딩에 실패했다는 의미로, 스토리보드의 뷰와 아웃렛 변수가 아직 연결되지 않아 nil이기 때문에 발생한 것입니다. 따라서 모든 연결이 완료된 이후 호출되는 awakeFromNib 메서드에서 configureSubviews를 호출해야 합니다.
 
 Travel_Project/MagazineInfoTableViewCell.swift:37: Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value
 */
