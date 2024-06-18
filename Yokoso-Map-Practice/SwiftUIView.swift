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
        
        Button(action: {
            // Add your action here
        }) {
            Text("Go Here !!")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        }
        .padding(.horizontal)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
