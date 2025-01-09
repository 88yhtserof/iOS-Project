//
//  SampleCollectionViewController.swift
//  ThirdProject
//
//  Created by 임윤휘 on 1/9/25.
//

import UIKit

class SampleCollectionViewController: UIViewController {
    @IBOutlet var bannerCollectionView: UICollectionView!
    @IBOutlet var listCollectionView: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    
    var totalList: [Int] = Array(1...100)
    lazy var filteredList: [Int] = totalList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        configureCollectionView()
        configureCollectionViewLayout()
        configureListCollectionViewLayout()
        
//        print(1)
//        DispatchQueue.main.async {
//            print(2)
//        }
//        print(3)
    }
    
    func configureCollectionView() {
        bannerCollectionView.backgroundColor = .black
        bannerCollectionView.isPagingEnabled = true // 무조건 아이폰 너비만큼 paging됨
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        let id = SampleCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        bannerCollectionView.register(xib, forCellWithReuseIdentifier: id)
        
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        listCollectionView.register(xib, forCellWithReuseIdentifier: id)
    }
    
    func configureCollectionViewLayout() {
        let width = UIScreen.main.bounds.width // deprecated될 예정
        /*
         왜 deprecated될 예정일까 -> App/Scene Delegate
         아이폰은 항상 하나의 앱만 띄울수 있으니깐 상관없지만, 아이패드의 경우, 분할 화면에 의해 앱의 화면과 동일한 크기를 받아올 수 없다
         */
//        let width = view.window?.windowScene?.screen.bounds.width ?? 0 // 안 나오네
        
        // 타입 멤버는 타입으로 통해 접근할 수 있고, 인스턴스 멤버는 인스턴스를 통해 접근할 수 있다
        // 따라서 타입 멤버 사용 시 타입.멤버 로 사용
        // 인스턴스 멤버들은 사실 앞에 self가 생략되어 있다
        bannerCollectionView.collectionViewLayout = SampleCollectionViewController.configureCollectionViewLayout()
    }
    
    func configureListCollectionViewLayout() {
        let sectionInset: CGFloat = 16
        let spacing: CGFloat = 16
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        // (화면 너비 - (inset + spacing)) / 3
        let width = listCollectionView.bounds.width
//        let widthS = UIScreen.main.bounds.width
        let itemWidth = (width - (sectionInset * 2 + spacing * 2)) / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        
        listCollectionView.collectionViewLayout = layout
    }
}

extension SampleCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        searchBar.setShowsCancelButton(false, animated: true)
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        searchBar.setShowsCancelButton(false, animated: true)
        view.endEditing(true)
    }
    
    // 최근 검색어 기능 구현 시 주로 사용
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(#function)
//        searchBar.showsCancelButton = true
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    // 실시간 검색
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
        
        var result: [Int] = []
        
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            filteredList = totalList
        } else {
            for item in totalList {
                if let num = Int(searchText), num == item {
                    result.append(num)
                }
            }
        }
        filteredList = result
        listCollectionView.reloadData()
    }
}

extension SampleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SampleCollectionViewCell.identifier, for: indexPath) as? SampleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .red
        cell.photoImageView.backgroundColor = .white
        cell.titleLabel.text = "\(filteredList[indexPath.item])"
//        cell.photoImageView.layer.cornerRadius = cell.photoImageView.frame.height / 2
        
        // 우회적인 방법
        // GCD
        DispatchQueue.main.async {
            cell.photoImageView.layer.cornerRadius = cell.photoImageView.frame.height / 2
        }
        
        return cell
    }
    
    
}
