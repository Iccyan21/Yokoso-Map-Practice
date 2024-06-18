//
//  MapView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/14.
//

import SwiftUI
import MapKit

class MapViewModel: ObservableObject {
    @Published var points: [MapPoint] = []
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917), // 初期の中心点
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    func fetchMapPoints() {
        guard let url = URL(string: "http://127.0.0.1:8000/map/mappoints/") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)") // ステータスコードのログ
            }
            
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([MapPoint].self, from: data)
                    DispatchQueue.main.async {
                        self.points = decodedResponse
                    }
                } catch {
                    print("JSON Decoding Error: \(error)")
                }
            }

            
            if let error = error {
                print("Fetch failed: \(error.localizedDescription)")
            } else {
                print("Fetch failed: Unknown error or no data")
            }
        }.resume()

    }
}

struct MapView: View {
    @StateObject var viewModel = MapViewModel()
    @State private var selection: UUID?
    @State private var showDetails: Bool = false
    @State private var selectedStation: StationPoint?
    @State private var selectedLocation: MapPoint?
    
    var body: some View {
        //Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.points) { point in
            //MapMarker(coordinate: point.coordinate, tint: .blue)
        //}
        //.onAppear {
        //    viewModel.fetchMapPoints()
        //}
        Map(selection: $selection){
            UserAnnotation()
            ForEach(viewModel.points){ location in
                Annotation(location.name, coordinate: location.coordinate) {
                    Button(action: {
                        print("Marker tapped")
                        self.selectedLocation = location
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
        }.onAppear{
            viewModel.fetchMapPoints()
        }
        .sheet(isPresented: $showDetails) {
            if let selectedLocation = selectedLocation {
                LocationDetailView(location: selectedLocation)
            }
        }
        .sheet(isPresented: $showDetails){
            NewPlaceView()
        }
    }
}

#Preview {
    MapView()
}

// 型は合わせる
struct MapPoint: Identifiable, Decodable {
    var id: Int
    var name: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

// 詳細ビューの定義
struct LocationDetailView: View {
    let location: MapPoint
    
    var body: some View {
        VStack {
            Text("Hello")
            Text(location.name)
                .font(.largeTitle)
                .padding()
            
            Text("Latitude: \(location.coordinate.latitude)")
            Text("Longitude: \(location.coordinate.longitude)")
        }
        .padding()
    }
}
