//
//  ContentView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/02.
//

import SwiftUI
import MapKit

import Foundation


// MapViewの定義
struct MapView2: UIViewRepresentable {
    @Binding var route: MKRoute?
    @Binding var selectedPlace: CLLocationCoordinate2D?
    @Binding var selectedStation: StationPoint?
    @Binding var showButtons: Bool
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView2
        
        init(parent: MapView2) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let route = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: route)
                renderer.strokeColor = .blue
                renderer.lineWidth = 5
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation as? MKPointAnnotation,
               let station = parent.stations.first(where: { $0.coordinate.isEqual(to: annotation.coordinate) }) {
                parent.selectedStation = station
                parent.showButtons = true // 駅が選択された時にボタンを表示
            }
        }
    }
    
    var stations: [StationPoint]
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // 駅のピンを地図に追加
        for station in stations {
            let annotation = MKPointAnnotation()
            annotation.coordinate = station.coordinate
            annotation.title = station.name
            mapView.addAnnotation(annotation)
        }
        
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeOverlays(mapView.overlays)
        
        if let route = route {
            mapView.addOverlay(route.polyline)
        }
        
        if let selectedPlace = selectedPlace {
            let annotation = MKPointAnnotation()
            annotation.coordinate = selectedPlace
            mapView.addAnnotation(annotation)
            mapView.setRegion(MKCoordinateRegion(center: selectedPlace, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: true)
        }
    }
}

// ContentViewの定義
struct ContentView: View {
    @State private var route: MKRoute?
    @State private var selectedPlace: CLLocationCoordinate2D?
    @State private var selectedStation: StationPoint?
    @State private var showButtons = false
    
    var body: some View {
        VStack {
            MapView2(route: $route, selectedPlace: $selectedPlace, selectedStation: $selectedStation, showButtons: $showButtons, stations: stations)
                .edgesIgnoringSafeArea(.all)
            
            if showButtons {
                HStack {
                    Button("Show Route") {
                        if let selectedStation = selectedStation {
                            calculateRoute(to: selectedStation.coordinate)
                        }
                    }
                    .padding()
                    
                    Button("Cancel") {
                        route = nil
                        selectedStation = nil // PickerをリセットするためにselectedStationをnilに設定
                        showButtons = false // ボタンを隠す
                    }
                    .padding()
                }
            }
        }
    }
    
    func calculateRoute(to destination: CLLocationCoordinate2D) {
        // 選択した場所を設定
        let sourceLocation = CLLocationCoordinate2D(latitude: 35.681236, longitude: 139.767125) // 東京駅
        let destinationLocation = destination
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation)
        
        let sourceItem = MKMapItem(placemark: sourcePlacemark)
        let destinationItem = MKMapItem(placemark: destinationPlacemark)
        
        let request = MKDirections.Request()
        request.source = sourceItem
        request.destination = destinationItem
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let route = response?.routes.first {
                self.route = route
                self.selectedPlace = destinationLocation
            }
        }
    }
}

#Preview {
    ContentView()
}





