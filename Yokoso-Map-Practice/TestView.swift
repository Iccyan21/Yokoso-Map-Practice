//
//  TestView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/10.
//

import SwiftUI
import MapKit

struct TestView: View {
    var body: some View {
        Map(){
            UserAnnotation()
        }
    }
}

#Preview {
    TestView()
}
