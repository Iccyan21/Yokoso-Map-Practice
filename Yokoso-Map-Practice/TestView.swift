//
//  TestView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/10.
//

import SwiftUI
import MapKit

struct TestView: View {
    @State private var route: MKRoute?
    @State private var isShowingRoutes = false
    
    var body: some View {
        VStack {
            Toggle("ルートを表示", isOn: $isShowingRoutes)
                .padding([.horizontal, .top])
            
            if isShowingRoutes {
                Map {
                    if let routePolyline = route?.polyline {
                        MapPolyline(routePolyline)
                            .stroke(.blue, lineWidth: 8)
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    HStack(spacing: 32) {
                        Spacer()
                        Button {
                            Task {
                                route = await calculateRoute(from: .TokyoStation, to: .ShibuyaStation, transportType: .walking)
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
                                route = await calculateRoute(from: .TokyoStation, to: .ShibuyaStation, transportType: .automobile)
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
                                route = await calculateRoute(from: .TokyoStation, to: .ShibuyaStation, transportType: .transit)
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
                        Spacer()
                    }
                    .background(.thinMaterial)
                }
            } else {
                Map {
                    MapPolyline(coordinates: [.TokyoStation, .ShibuyaStation], contourStyle: .straight)
                        .stroke(.blue, lineWidth: 8)
                }
            }
        }
        .task {
            route = await calculateRoute(from: .TokyoStation, to: .ShibuyaStation, transportType: .walking)
        }
    }
}

#Preview {
    TestView()
}
