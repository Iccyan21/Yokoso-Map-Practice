//
//  ContentView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/02.
//

import SwiftUI
import MapKit


struct ContentView: View {
    @State private var showDetails = false
    @State private var selectedStation: StationPoint? = nil
    @State private var route: MKRoute?
    @State private var isShowingRoutes = false
    @State private var transportType: MKDirectionsTransportType = .walking
    @State private var showTransportOptions = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if isShowingRoutes, let route = route {
                    Map {
                        MapPolyline(route.polyline)
                            .stroke(.blue, lineWidth: 8)
                    }
                    .edgesIgnoringSafeArea(.all)
                } else {
                    Map {
                        let locations = [
                            StationPoint(name: "東京駅", coordinate: .TokyoStation),
                            StationPoint(name: "渋谷駅", coordinate: .ShibuyaStation),
                            StationPoint(name: "新宿駅", coordinate: .ShinjukuStation)
                            // 他の駅も追加
                        ]
                        
                        ForEach(locations) { location in
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
                        }
                    }
                }
                
                // 交通手段を選択するボタンを経路ボタンが押されたときに表示
                if showTransportOptions {
                    HStack(spacing: 32) {
                        Spacer()
                        Button {
                            Task {
                                if let station = selectedStation, let calculatedRoute = await calculateRoute(from: .TokyoStation, to: station.coordinate, transportType: .walking) {
                                    route = calculatedRoute
                                    isShowingRoutes = true
                                    transportType = .walking
                                } else {
                                    print("徒歩ルート計算に失敗しました。")
                                }
                            }
                        } label: {
                            Image(systemName: "figure.walk")
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.white)
                                )
                                .padding(.top, 8)
                        }
                        
                        Button {
                            Task {
                                if let station = selectedStation, let calculatedRoute = await calculateRoute(from: .TokyoStation, to: station.coordinate, transportType: .automobile) {
                                    route = calculatedRoute
                                    isShowingRoutes = true
                                    transportType = .automobile
                                } else {
                                    print("自動車ルート計算に失敗しました。")
                                }
                            }
                        } label: {
                            Image(systemName: "car.fill")
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.white)
                                )
                                .padding(.top, 8)
                        }
                        
                        Button {
                            Task {
                                if let station = selectedStation, let calculatedRoute = await calculateRoute(from: .TokyoStation, to: station.coordinate, transportType: .transit) {
                                    route = calculatedRoute
                                    isShowingRoutes = true
                                    transportType = .transit
                                } else {
                                    print("公共交通機関ルート計算に失敗しました。")
                                }
                            }
                        } label: {
                            Image(systemName: "tram.fill")
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.white)
                                )
                                .padding(.top, 8)
                        }
                        
                        Button {
                            route = nil
                            isShowingRoutes = false
                            showTransportOptions = false
                        } label: {
                            Text("キャンセル")
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.white)
                                )
                                .padding(.top, 8)
                        }
                        Spacer()
                    }
                    .background(.thinMaterial)
                }
            }
            .sheet(isPresented: $showDetails) {
                if let station = selectedStation {
                    StationDetail(
                        startStation: StationPoint(name: "東京駅", coordinate: .TokyoStation),
                        endStation: station
                    ) {
                        self.showDetails = false
                        self.showTransportOptions = true
                    }
                } else {
                    Text("No station selected")
                        .edgesIgnoringSafeArea(.all)
                        .background(Color.clear)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}





