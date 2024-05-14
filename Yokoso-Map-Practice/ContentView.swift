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
    @State private var inputText = ""
    @State private var showDetails: Bool = false
    @State private var selectedStation: StationPoint?
    @State private var showSheet = false
    @State private var searchText = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.6937, longitude: 135.5023), // 例: 大阪の位置
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    // ユーザーのカメラ位置を管理
    // もし掴み取れない場合は東京駅を表示
    @State private var userCameraPosition: MapCameraPosition = .userLocation(followsHeading: false,
                                                                             fallback:
            .camera(MapCamera(centerCoordinate: .TokyoStation,distance: 5000,pitch: 60)))
    
    var filteredStations: [StationPoint] {
        if searchText.isEmpty {
            return stations
        } else {
            return stations.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(selection: $selection) {
                
                ForEach(filteredStations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Button(action: {
                            print("Marker tapped")
                            self.selectedStation = location
                            self.showDetails.toggle()
                            print(location)
                        }) {
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
            }
            TextField("Search", text: $searchText)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal)
                .padding(.top, 10)  // 上部に少し余白を設ける
            
        }
        .sheet(isPresented: $showSheet) {
            HalfsheetView()
                .edgesIgnoringSafeArea(.all)  // Safe Area を無視して全画面に拡大
                .background(Color.clear)  // 背景を透明に設定
                .presentationDetents([
                    .medium,
                    .large,
                    .height(200),
                    .fraction(0.8)
                ])
        }
        .sheet(isPresented: $showDetails) {
            if let station = selectedStation {
                StationDetail(station: station)
                    .edgesIgnoringSafeArea(.all)  // Safe Area を無視して全画面に拡大
                    .background(Color.clear)  // 背景を透明に設定
            } else {
                Text("No station selected")
                    .edgesIgnoringSafeArea(.all)  // Safe Area を無視して全画面に拡大
                    .background(Color.clear)  // 背景を透明に設定
            }
        }
    }
    
    func search() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let coordinate = response?.mapItems.first?.placemark.coordinate else { return }
                region.center = coordinate
        }
    }
}

#Preview {
    ContentView()
}

struct SearchView: View {
    @Binding var searchText: String  // 検索テキスト
    
    var body: some View {
        VStack {
            Text("Enter search terms:")
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

