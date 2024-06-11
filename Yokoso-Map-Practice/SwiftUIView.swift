//
//  SwiftUIView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/05.
//

import SwiftUI
import MapKit

struct SwiftUIView: View {
    @State private var text: String = ""
    @State private var searchResults: [MKMapItem] = []
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter text", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
        .padding()
       
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
