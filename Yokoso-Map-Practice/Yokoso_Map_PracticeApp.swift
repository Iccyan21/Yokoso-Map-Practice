//
//  Yokoso_Map_PracticeApp.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/02.
//

import SwiftUI

@main
struct Yokoso_Map_PracticeApp: App {
    @AppStorage("hasSeenTutorial") var hasSeenTutorial: Bool = false
    var body: some Scene {
        WindowGroup {
            if hasSeenTutorial{
                HomeView()
            } else {
                TutorialView()
            }
        }
    }
}
