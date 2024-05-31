//
//  ContentView2.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/30.
//

import SwiftUI
import MapKit


struct ContentView2: View {
    @State private var showMap = true
    @State private var showCancelButton = false
    
    var body: some View {
        VStack {
            if showMap {
                MapView2()
                    .equatable()
            }
            
            if showCancelButton {
                Button("Cancel") {
                    // Show/hide the map without triggering a redraw
                    showMap.toggle()
                    // Reset showMap to its original state to prevent redraw
                    DispatchQueue.main.async {
                        showMap.toggle()
                    }
                }
            }
        }
        .onAppear {
            // Simulate showing the cancel button after some operation
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showCancelButton = true
            }
        }
    }
}

struct MapView2: View, Equatable {
    static func == (lhs: MapView2, rhs: MapView2) -> Bool {
        return true // Always equal to prevent redraw
    }
    
    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
