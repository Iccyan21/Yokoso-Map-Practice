//
//  ContentView2.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/30.
//

import SwiftUI
import MapKit

struct MapState {
    var region: MKCoordinateRegion
}

class MapViewModel2: ObservableObject {
    @Published var currentRegion: MKCoordinateRegion
    private var initialState: MapState
    
    init(region: MKCoordinateRegion) {
        self.currentRegion = region
        self.initialState = MapState(region: region)
    }
    
    func saveState() {
        initialState = MapState(region: currentRegion)
    }
    
    func restoreState() {
        currentRegion = initialState.region
    }
}

struct ContentView2: View {
    @StateObject private var viewModel = MapViewModel2(region: MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.681236, longitude: 139.767125),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    ))
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $viewModel.currentRegion)
                .edgesIgnoringSafeArea(.all)
            HStack {
                Button(action: {
                    viewModel.saveState()
                    // ナビゲーションを開始する処理をここに追加
                }) {
                    Text("ナビゲーション開始")
                }
                Button(action: {
                    viewModel.restoreState()
                }) {
                    Text("キャンセル")
                }
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
