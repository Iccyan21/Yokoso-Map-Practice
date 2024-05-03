//
//  LocationButton.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/02.
//

import SwiftUI
import MapKit

struct LocationButton: View {
    
    @Binding var position: MapCameraPosition
    
    var body: some View {
        
        Button {
            position = .userLocation(fallback: .automatic)
        } label: {
            Label("ふるさと",systemImage: "location.circle")
        }
    }
}
