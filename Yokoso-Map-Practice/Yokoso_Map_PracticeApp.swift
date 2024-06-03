//
//  Yokoso_Map_PracticeApp.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/02.
//

import SwiftUI

@main
struct Yokoso_Map_PracticeApp: App {
    var body: some Scene {
        WindowGroup {
            MapView2(stations: stations)
        }
    }
}
