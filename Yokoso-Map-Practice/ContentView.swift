//
//  ContentView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/02.
//

import SwiftUI
import MapKit



struct ContentView: View {
    let locationManager = LocationManager()
    // ユーザーのカメラ位置を管理
    // もし掴み取れない場合は東京駅を表示
    @State private var userCameraPosition: MapCameraPosition = .userLocation(followsHeading: false,
                                                                             fallback:
            .camera(MapCamera(centerCoordinate: .TokyoStation,distance: 5000,pitch: 60)))
    
    var body: some View {
        Map(position: $userCameraPosition) {
            Annotation("Station",coordinate: .TokyoStation,anchor: .bottom)
            {
                Image(systemName: "tram")
                    .padding(4)
                    .foregroundStyle(.white)
                    .background(Color.blue)
                    .cornerRadius(4)
                
            }
            UserAnnotation()
        }
    }
}

#Preview {
    ContentView()
}
