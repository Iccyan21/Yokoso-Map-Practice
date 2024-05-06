//
//  LocationManager.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/06.
//

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
}
