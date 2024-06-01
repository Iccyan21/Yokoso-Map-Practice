//
//  StationPoint.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/09.
//

import MapKit

struct StationPoint: Identifiable, Equatable, Hashable {
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    
    static func == (lhs: StationPoint, rhs: StationPoint) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
