//
//  StationDetail.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/10.
//

import SwiftUI
import MapKit



struct StationDetail: View {
    var startStation: StationPoint
    var endStation: StationPoint
    // 経路を案内するボタンを押したときに実行されるクロージャ
    // ユーザーがボタンを押したときに経路計算を開始するためのアクションを実行
    var onRouteRequested: () -> Void
    
    var body: some View {
        VStack {
            Text(endStation.name)
                .font(.title)
                .padding()
            
            HStack(spacing: 32) {
                Spacer()
                Button {
                    onRouteRequested()
                } label: {
                    Text("経路")
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
        .edgesIgnoringSafeArea(.all)
        .background(Color.clear)
    }
}


// Dummy function for calculateRoute
func calculateRoute(from sourceCoordinate: CLLocationCoordinate2D, to destinationCoordinate: CLLocationCoordinate2D, transportType: MKDirectionsTransportType) async -> MKRoute? {
    let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinate)
    let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate)
    
    let request = MKDirections.Request()
    request.source = MKMapItem(placemark: sourcePlacemark)
    request.destination = MKMapItem(placemark: destinationPlacemark)
    request.transportType = transportType
    
    let directions = MKDirections(request: request)
    do {
        let response = try await directions.calculate()
        return response.routes.first
    } catch {
        print("ルート計算エラー: \(error.localizedDescription)")
        return nil
    }
}


enum TransportType {
    case walking, driving, transit
}

