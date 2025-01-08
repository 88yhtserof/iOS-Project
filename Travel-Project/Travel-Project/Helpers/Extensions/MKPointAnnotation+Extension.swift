//
//  MKPointAnnotation+Extension.swift
//  Travel-Project
//
//  Created by 임윤휘 on 1/9/25.
//

import MapKit

extension MKPointAnnotation {
    convenience init(title: String, coordinate: CLLocationCoordinate2D) {
        self.init()
        self.title = title
        self.coordinate = coordinate
    }
}
