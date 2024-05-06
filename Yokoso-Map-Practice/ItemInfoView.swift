//
//  ItemInfoView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/05.
//

import SwiftUI
import MapKit

struct ItemInfoView: View {
    @Binding var selectedResult: MKMapItem
    @Binding var route: MKRoute?
    
    @State private var lookAroundScene: MKLookAroundScene?
    
    func getLookAroundScene(){
        lookAroundScene = nil
        Task{
            let request = MKLookAroundSceneRequest(mapItem: selectedResult)
            lookAroundScene = try? await request.scene
        }
    }
    private var travelTime: String? {
        guard let route else { return nil }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: route.expectedTravelTime)
    }
    
    var body: some View {
        LookAroundPreview(initialScene: lookAroundScene)
            .overlay(alignment: .bottomTrailing){
                HStack{
                    Text("\(selectedResult.name ?? "")")
                    if let travelTime {
                        Text(travelTime)
                    }
                }
                .font(.caption)
                .foregroundStyle(.white)
                .padding()
            }
            .onAppear{
                getLookAroundScene()
            }
            .onChange(of: selectedResult){
                getLookAroundScene()
            }
    }
    
}

