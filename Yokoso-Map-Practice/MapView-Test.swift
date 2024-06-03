//
//  MapView-Test.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/03.
//

import SwiftUI
import MapKit

struct MapView_Test: View {
    @State private var selection: UUID?
    @State private var showDetails: Bool = false
    @State private var selectedStation: StationPoint?
    @State private var selectedLocation: StationPoint? 
    @State private var selectedPlace: CLLocationCoordinate2D?
    @State private var showButtons = false
    
    var stations: [StationPoint]
    
    var body: some View {
        Map(selection: $selection){
            ForEach(stations){ location in
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
        }
    }
}

#Preview {
    MapView_Test(stations: stations)
}
