//
//  BeantownButtons.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/04.
//

import SwiftUI
import MapKit

struct BeantownButtons: View {
    @Binding var searchResults: [MKMapItem] 
    var body: some View {
        HStack{
            Button{
                search(for:"playground")
            } label: {
                Label("Playgrounds",systemImage: "figure.and.child.holdinghands")
            }.buttonStyle(.borderedProminent)
            
            Button{
                search(for: "beach")
            } label: {
                Label("beachs",systemImage: "beach.umbrella")
            } .buttonStyle(.borderedProminent)
        }
        .labelStyle(.iconOnly)
    }
    func search(for query: String){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(
            center: .parking,
            span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))
        Task{
            let search = MKLocalSearch(request: request)
            let responce = try? await search.start()
            searchResults = responce?.mapItems ?? []
        }
    }
}


