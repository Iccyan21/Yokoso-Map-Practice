//
//  ContentView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/02.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var position: MapCameraPosition = .automatic // ←ここ追加
    
    var body: some View {
        Map(position: $position) {
            UserAnnotation(anchor: .center) // ←ここ追加
            
            Annotation("大阪駅",coordinate: .osaka_station,anchor: .bottom){
                HStack{
                    Image(systemName: "flag.2.crossed")
                    Text("大阪駅")
                    LocationButton(position: $position) // ←ここ追加
                }
                .foregroundColor(.blue)
                .padding()
                .background(in: .capsule)
            }
        }
        .mapControls {
            MapUserLocationButton()
        }

    }
}

extension CLLocationCoordinate2D {
    static let osaka_station = CLLocationCoordinate2D(latitude: 34.7024854, longitude: 135.4933757)

}

#Preview {
    ContentView()
}
