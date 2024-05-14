//
//  HalfsheetView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/13.
//

import SwiftUI

struct HalfsheetView: View {
    @State private var searchText = ""
    var body: some View {
        VStack {
            Text("Enter search terms:")
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

#Preview {
    HalfsheetView()
}
