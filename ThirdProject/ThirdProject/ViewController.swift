//
//  ViewController.swift
//  ThirdProject
//
//  Created by 임윤휘 on 1/8/25.
//

import UIKit
import MapKit

class User {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var mapView: MKMapView!
    
    let pickerView = UIPickerView()
    
    // 둘 다 가능
    let user: [User] = [
        User(name: "사과"),
        .init(name: "포도") // 인스턴스 생성 시 위보다 더 오래 걸림
    ]
    /*
     특히 string은 생성 방식에 따라 인스턴스 생성 비용이 다르다
     특히 init(name: "포도") 형식이 가장 오래 걸림
     */
    
    let list = ["가", "나", "다"]
    let numberList = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTextField.delegate = self
        
        secondTextField.tintColor = .clear
        secondTextField.text = list[0]
        secondTextField.inputView = pickerView
        secondTextField.delegate = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        mapView.delegate = self
        configureMapView()
    }
}

//MARK: - Configuration
extension ViewController {
    func configureMapView() {
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
        
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500) // 중간 지점 설정
        let anotation = MKPointAnnotation()
        anotation.coordinate = center
        anotation.title = "창동"
        
        mapView.addAnnotation(anotation)
    }
}

//MARK: - PickerView
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? list.count : numberList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return list[row]
        } else {
            return numberList[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            secondTextField.text = list[row]
        } else {
            secondTextField.text = numberList[row]
        }
    }
}

//MARK: - TextField
extension ViewController: UITextFieldDelegate {
    // 키보드에서 엔터키를 클릭했을때
    // did end of exit
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == firstTextField { // 또는 secondTextFiedl의 delegate 설정 안 하기
            view.endEditing(true)
        }
        view.endEditing(true)
        return true
    }
}
