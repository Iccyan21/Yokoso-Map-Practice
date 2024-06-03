//
//  MapView2.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/01.
//

import SwiftUI
import MapKit
import Combine
import Foundation
import CoreLocation

// データバインディング機能と位置情報の更新を管理
class MapViewModel:  NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var places: [PlaceModel] = []
    // 表示されない時の初期位置
    // 大阪駅を表示
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.7024854, longitude: 135.4959506),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    // 現在地?
    @Published var userLocation: CLLocationCoordinate2D?
    
    // 位置情報を取得のオブジェクト
    private var locationManager = CLLocationManager()
    
    // 初期化されるときに呼び出す
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        // ユーザーの位置情報の取得し始める
        locationManager.startUpdatingLocation()
    }
    
    // データ読み込み
    func loadPlaces(){
        // 仮データを読み込む
        self.places = SamplePlaces
    }
    // 位置情報サービスの許可状態が変更された際に呼ばれる
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
    // 新しい位置情報が利用可能になると呼ばれるデリゲートメソッド
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 最新の位置情報を取得
        if let location = locations.first {
            let newRegion = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            DispatchQueue.main.async {
                self.region = newRegion
                self.userLocation = location.coordinate
            }
            locationManager.stopUpdatingLocation()
        }
    }
}

struct MapView: View {
    @StateObject var mapviewModel = MapViewModel()
    @StateObject var routeViewModel = RouteViewModel()
    @State private var selection: Int?
    @State private var showDetails: Bool = false
    @State private var selectedPlace: PlaceModel?
    @State private var selectedLocation: PlaceModel?
    // 場所まで案内のもの
    // 計算されたルート情報（経路、距離、時間など）を保持
    @State private var route: MKRoute?
    // ルート情報の表示・非表示を管理するブール値
    // ルート情報を表示するUI要素を表示するかどうかを制御
    @State private var isShowingRoutes = false
    // 現在選択されている交通手段の種類を格納します。デフォルトでは「徒歩」に設定
    // ルート計算時に使用する交通手段を指定します
    @State private var transportType: MKDirectionsTransportType = .walking
    //  交通手段オプションの表示・非表示を管理するブール値
    // ユーザーが交通手段を選択できるUI要素を表示するかどうかを制御
    @State private var showTransportOptions = false
    // 元の地域を保存
    @State private var showPlaceDetailView = false // 新しい状態
    
    
    var body: some View {
        ZStack{
            VStack{
                // routeが存在する場合にその値をrouteとして使用
                if isShowingRoutes, let route = route {
                    Map {
                        // routeのpolyline（経路のポリラインデータ）を使用して地図上に線を描画
                        MapPolyline(route.polyline)
                            .stroke(.blue, lineWidth: 5)
                        
                        if let userLocation = mapviewModel.userLocation {
                            Annotation("", coordinate: userLocation) {
                                Circle()
                                    .foregroundStyle(.blue)
                                    .padding(2)
                                    .background(
                                        Circle()
                                            .fill(.white)
                                    )
                            }
                        }
                        
                        if let destination = selectedPlace?.coordinate, let placeName = selectedPlace?.place_name {
                            Annotation(placeName, coordinate: destination) {
                                Image(systemName: "mappin.circle.fill")
                                    .foregroundColor(.green)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .onAppear {
                                        print("目的地のAnnotationが表示されました: \(destination)")
                                    }
                                    .onDisappear {
                                        print("目的地のAnnotationが消えました: \(destination)")
                                    }
                            }
                        }
                    }.safeAreaInset(edge: .bottom) {
                        
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                    // 所要時間を表示
                    let travelTime = route.expectedTravelTime
                    Text("Estimated travel time: \(Int(travelTime / 60)) minutes")
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.top, 8)
                    
                } else {
                    Map(selection: $selection) {
                        ForEach(mapviewModel.places) { place in
                            Annotation(place.place_name, coordinate: place.coordinate) {
                                Button(action: {
                                    self.selectedLocation = place
                                    DispatchQueue.main.async {
                                        self.showDetails = true
                                        
                                        self.selectedPlace = place
                                    }
                                }) {
                                    VStack {
                                        Image(systemName: "mappin")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.white)
                                            .padding(6)
                                            .background(Color.blue)
                                            .clipShape(Circle())
                                    }
                                }
                            }.tint(.blue)
                        }
                        UserAnnotation()
                    }
                    
                    .mapControls {
                        MapUserLocationButton()
                    }
                    .onAppear {
                        // 表示された時にすぐ読み込み
                        mapviewModel.loadPlaces()
                    }
                    .sheet(item: $selectedLocation, onDismiss: {
                        self.selectedLocation = nil
                        
                    }) { place in
                        if let userLocation = mapviewModel.userLocation {
                            PlaceDetailView(current_location: userLocation,place: place, onRouteRequested: {
                                Task {
                                    if let calculatedRoute = await
                                        // ルートを計算
                                        routeViewModel.calculateRoute(from: userLocation, to: place.coordinate, transportType: transportType) {
                                        route = calculatedRoute
                                        isShowingRoutes = true
                                        print(isShowingRoutes)
                                        // 計算された経路を格納
                                        routeViewModel.directions = [calculatedRoute]
                                    } else {
                                        print("ルート計算に失敗")
                                    }
                                }
                            }, onTransportOptionsRequested: {
                                self.showTransportOptions = true
                            })
                        } else {
                            Text("現在地を取得できませんでした。")
                        }
                    }
                }
                
                // 交通手段を選択する経路ボタンが押された時に表示
                if showTransportOptions {
                    HStack(spacing: 32){
                        Spacer()
                        Button {
                            Task {
                                print("Walking button pressed")
                                if let place = selectedPlace, let currentLocation = mapviewModel.userLocation {
                                    print("Calculating walking route from \(currentLocation) to \(place.coordinate)")
                                    if let calculatedRoute = await routeViewModel.calculateRoute(from: currentLocation, to: place.coordinate, transportType: .walking) {
                                        route = calculatedRoute
                                        isShowingRoutes = true
                                        transportType = .walking
                                        print("正常3")
                                        routeViewModel.directions = [calculatedRoute]
                                    } else {
                                        print("ルート計算に失敗")
                                    }
                                } else {
                                    print("selectedPlace または currentLocation が nil です")
                                }
                            }
                        }  label: {
                            Image(systemName: "figure.walk")
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.white)
                                )
                                .padding(.top, 8)
                        }
                        
                        Button{
                            Task {
                                if let place = selectedPlace, let currentLocation = mapviewModel.userLocation {
                                    if let calculatedRoute = await routeViewModel.calculateRoute(from: currentLocation, to: place.coordinate, transportType: .automobile) {
                                        route = calculatedRoute
                                        isShowingRoutes = true
                                        transportType = .automobile
                                        routeViewModel.directions = [calculatedRoute]
                                    } else {
                                        print("ルート計算に失敗")
                                    }
                                }
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
                        
                        Button{
                            Task {
                                if let place = selectedPlace, let currentLocation = mapviewModel.userLocation {
                                    if let calculatedRoute = await routeViewModel.calculateRoute(from: currentLocation, to: place.coordinate, transportType: .transit) {
                                        route = calculatedRoute
                                        isShowingRoutes = true
                                        transportType = .transit
                                        print("正常1")
                                        routeViewModel.directions = [calculatedRoute]
                                    } else {
                                        print("ルート計算に失敗")
                                    }
                                }
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
                        
                        Button {
                            isShowingRoutes = false
                            showTransportOptions = false
                        } label: {
                            Text("Cansel")
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.white)
                                )
                                .padding(.top, 8)
                        }
                        Spacer()
                    }.background(.thinMaterial)
                }
            }
        }
    }
}


class RouteViewModel: ObservableObject {
    @Published var directions: [MKRoute] = []
    
    func calculateRoute(from start: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, transportType: MKDirectionsTransportType) async -> MKRoute? {
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        // 交通手段（例：徒歩、自転車、車）を設定
        request.transportType = transportType
        
        let directions = MKDirections(request: request)
        return await withCheckedContinuation { continuation in
            // 経路計算を開始
            directions.calculate { response, error in
                if let error = error {
                    print("Error calculating directions: \(error)")
                    continuation.resume(returning: nil)
                    return
                }
                
                if let route = response?.routes.first {
                    continuation.resume(returning: route)
                } else {
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}

enum TransportType {
    case walking, driving, transit
}

#Preview {
    MapView()
}
