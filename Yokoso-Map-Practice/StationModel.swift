//
//  StationModel.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/09.
//

import Foundation
import MapKit

let stations = [
    StationPoint(name: "新宿駅", coordinate: .ShinjukuStation),
    StationPoint(name: "渋谷駅", coordinate: .ShibuyaStation),
    StationPoint(name: "東京駅", coordinate: .TokyoStation)
]

extension CLLocationCoordinate2D {
    static let ShinjukuStation = CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917)
    static let ShibuyaStation = CLLocationCoordinate2D(latitude: 35.6580, longitude: 139.7017)
    static let TokyoStation = CLLocationCoordinate2D(latitude: 35.6812, longitude: 139.7671)
    static let tokyoStationStreet = CLLocationCoordinate2D(latitude: 35.679981237178694, longitude: 139.76897015768628)
    
    // カスタムの比較関数
    func isEqual(to other: CLLocationCoordinate2D) -> Bool {
        return self.latitude == other.latitude && self.longitude == other.longitude
    }
}
