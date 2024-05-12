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
    @State private var selection: UUID?
    @State private var showDetails: Bool = false
    @State private var selectedStation: StationPoint?
    // ユーザーのカメラ位置を管理
    // もし掴み取れない場合は東京駅を表示
    @State private var userCameraPosition: MapCameraPosition = .userLocation(followsHeading: false,
                                                                             fallback:
            .camera(MapCamera(centerCoordinate: .TokyoStation,distance: 5000,pitch: 60)))
    
    var body: some View {
        Map(position: $userCameraPosition,selection: $selection) {
            ForEach(stations){ location in
                Marker(coordinate: location.coordinate){
                    Button(action: {
                        print("Marker tapped")
                        self.selectedStation = location
                        self.showDetails.toggle()
                    }){
                        VStack {
                            Text(location.name)
                                .foregroundColor(.black)
                                .font(.caption)
                            
                            Image(systemName: "tram.fill")
                                .foregroundColor(.blue)
                        }
                    }
    
                }
                .tint(.blue)
            }
        }.sheet(isPresented: $showDetails) {
            if let station = selectedStation {
                StationDetail(station: station)
            } else {
                Text("No station selected")
            }
        }

    }
}

#Preview {
    ContentView()
}
