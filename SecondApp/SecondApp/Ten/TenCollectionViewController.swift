//
//  TenCollectionViewController.swift
//  SecondApp
//
//  Created by 임윤휘 on 1/7/25.
//

/*
할 일이 많은 뷰를 위해 일을 위임받아 대리 수행할 필요가 있다
 -> Delegate
 1. 테이블뷰 이름
 2. 테이블뷰 부하 직원(프로토콜 채택)
 3. 필수 기능(필수 구현 메서드)
 4. 테이블뷰와 부하직원이 서로 연결(= 타입으로서의 프로토콜, Protocol as Type)
 */

import UIKit

class TenCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        let xib = UINib(nibName: "TenCollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "TenCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 100, left: 50, bottom: 100, right: 50)
        
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TenCollectionViewCell", for: indexPath) as? TenCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
