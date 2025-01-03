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
    
    // 이 생성자 알아보기
    // reuseIdentifier가 뭘까. 그냥 부모 생성자의 인자로 리터럴 값을 할당해도 될까.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        travelImageView.cornerRadius()
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .black
        subtitleLabel.font = .systemFont(ofSize: 10, weight: .light)
        titleLabel.textColor = .gray
        dateLabel.textColor = .lightGray
        dateLabel.font = .systemFont(ofSize: 8, weight: .light)
    }
}
