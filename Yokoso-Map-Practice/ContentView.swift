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

struct MapView2: View {
    @State private var mapView = MKMapView()
    @State private var route: MKRoute?
    @State private var selectedPlace: CLLocationCoordinate2D?
    @State private var selectedStation: StationPoint?
    @State private var showButtons = false
    
    var stations: [StationPoint]
    
    var body: some View {
        ZStack {
            MapViewWrapper(mapView: $mapView, route: $route, selectedPlace: $selectedPlace, stations: stations, selectedStation: $selectedStation, showButtons: $showButtons)
                .edgesIgnoringSafeArea(.all)
            
            if showButtons {
                VStack {
                    Spacer()
                    HStack {
                        Button("Show Route") {
                            if let selectedStation = selectedStation {
                                calculateRoute(to: selectedStation.coordinate)
                            }
                        }
                        .padding()
                        
                        Button("Cancel") {
                            route = nil
                            selectedPlace = nil // 選択された場所をリセット
                            selectedStation = nil // PickerをリセットするためにselectedStationをnilに設定
                            showButtons = false // ボタンを隠す
                        }
                        .padding()
                    }
                }
            }
        }
    }
    
    func calculateRoute(to destination: CLLocationCoordinate2D) {
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

struct MapViewWrapper: UIViewRepresentable {
    @Binding var mapView: MKMapView
    @Binding var route: MKRoute?
    @Binding var selectedPlace: CLLocationCoordinate2D?
    var stations: [StationPoint]
    @Binding var selectedStation: StationPoint?
    @Binding var showButtons: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
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
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeOverlays(uiView.overlays)
        
        if let route = route {
            uiView.addOverlay(route.polyline)
        }
        
        // 既存のアノテーションを削除
        uiView.removeAnnotations(uiView.annotations)
        
        // 新しいアノテーションを追加
        for station in stations {
            let annotation = MKPointAnnotation()
            annotation.coordinate = station.coordinate
            annotation.title = station.name
            uiView.addAnnotation(annotation)
        }
        
        // 選択された場所がある場合、その場所にアノテーションを追加
        if let selectedPlace = selectedPlace {
            let annotation = MKPointAnnotation()
            annotation.coordinate = selectedPlace
            uiView.addAnnotation(annotation)
            uiView.setRegion(MKCoordinateRegion(center: selectedPlace, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: true)
        }
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewWrapper
        
        init(_ parent: MapViewWrapper) {
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
                parent.selectedPlace = station.coordinate // 選択された駅の座標を保存
                parent.showButtons = true // 駅が選択された時にボタンを表示
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView2(stations: stations)
    }
}





