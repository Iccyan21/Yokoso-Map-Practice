//
//  ContentView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/02.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let tokyoStation = CLLocationCoordinate2D(latitude: 35.681271031625556, longitude: 139.76710334029735)
}

struct ContentView: View {
    let locationManager = LocationManager()
    
    @State private var userCameraPosition: MapCameraPosition = .userLocation(followsHeading: true,
                                                                             fallback: .camera(MapCamera(centerCoordinate: .tokyoStation,
                                                                                                         distance: 5000,
                                                                                                         pitch: 60)))
    
    var body: some View {
        Map(position: $userCameraPosition) {
            UserAnnotation()
        }
    }
}

#Preview {
    ContentView()
}
