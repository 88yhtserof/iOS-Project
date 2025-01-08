//
//  RestaurantInfoViewController.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/8/25.
//

import UIKit
import MapKit

/*
 protocol ViewControllerConfigurable: AnyObject {
     func configureSubviews()
 }
 
 위와 같이 프로토콜을 정의해 뷰컨트롤러를 규격화하고자 했습니다. 하지만 프로토콜에는 규격화 말고도 인터페이스 역할도 있습니다. 이러한 특성으로, 외부에서는 프로토콜을 통해 이 프로토콜을 채택한 개체에 어떤 멤버가 있을지 예상하고 그 멤버들을 쉽게 사용할 수 있습니다.
 configureSubviews()는 뷰컨트롤러의 내부에서 뷰의 추가적인 UI 옵션을 설정하는 메서드입니다. 따라서 외부적으로 존재가 알려질 필요가 없을 뿐더러 외부에서 호출되는 것은 메서드 구현 의도에서 벗어납니다. 이러한 이유로 ViewControllerConfigurable을 사용하지 않기로 결정했습니다.
 
 프로토콜은 다음과 같은 예시에서 더 적합하다고 생각됩니다.
 저의 모든 list cell에는 configure(with:) 메서드가 존재합니다. 이 메서드는 cellForRow에서 호출되어 해당하는 개체를 인수로 받아 cell의 내부 뷰들의 content를 채우는 역할을 수행합니다. 따라서 외부에서 이 메서드의 존재를 알아야 합니다.
 모든 list cell에 존재한다는 점과 외부에서 존재를 알아야 한다는 점에서 아래와 같이 프로토콜을 만들어 사용할 수 있을 것 같습니다.
 
 protocol ListCellConfigurable: AnyObject {
     associatedtype Item
 
     func configure(with: Item)
 }
 */

class RestaurantInfoViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    private lazy var filterBarButtonItem = UIBarButtonItem(title: "filter", style: .plain, target: self, action: #selector(filterBarButtonItemDidTapped))
    
    private let restaurants = Restaurant.restaurants
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        navigationItem.rightBarButtonItem = filterBarButtonItem
        
        configureMapView()
    }
    
    private func configureMapView(_ category: Restaurant.Category? = nil) {
        mapView.removeAnnotations(mapView.annotations)
        var annotations: [ MKPointAnnotation ] = []
        var (maxLati, minLati): (CLLocationDegrees, CLLocationDegrees) = (restaurants[0].latitude, restaurants[0].latitude)
        var (maxLong, minLong) : (CLLocationDegrees, CLLocationDegrees) = (restaurants[0].longitude, restaurants[0].longitude)
        
        
        var filteredRestaurants = restaurants
        if let category {
            filteredRestaurants = restaurants.filter{ $0.category_kind == category }
        }
        
        filteredRestaurants
            .forEach {
                maxLati = max(maxLati, $0.latitude)
                minLati = min(minLati, $0.latitude)
                maxLong = max(maxLong, $0.longitude)
                minLong = min(minLong, $0.longitude)
                
                annotations.append(MKPointAnnotation(title: $0.name, coordinate: CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)))
            }
        
        mapView.addAnnotations(annotations)
        
        let middleLati = (maxLati + minLati) / 2
        let middleLong = (maxLong + minLong) / 2
        let center = CLLocationCoordinate2D(latitude: middleLati, longitude: middleLong)
        
        // (큰lati - 작은lati) * (큰lon - 작은lon)
        let longitudinalMeters = ((maxLong - minLong) * 100000) // 경도
        let latitudinalMeters = ((maxLati - minLati) * 100000) +  50 // 위도
        
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: latitudinalMeters, longitudinalMeters: longitudinalMeters)
    }
    
    @objc
    func filterBarButtonItemDidTapped() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancelAction)
        
        Restaurant.Category.allCases
            .forEach { category in
                let action = UIAlertAction(title: category.title, style: .default) { [self] _ in
                    self.configureMapView(category)
                }
                alert.addAction(action)
            }
        
        present(alert, animated: true)
    }
}


