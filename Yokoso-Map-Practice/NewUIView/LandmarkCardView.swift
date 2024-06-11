//
//  LandmarkCardView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/10.
//

import SwiftUI



struct LandmarkCardView: View {
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("Tsutenkaku-1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 175)
                .clipped()
                .cornerRadius(10)
           
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Osaka")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("123m")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
        }
        .frame(width: 140, height: 260) // Set the same frame size for both cards
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(1), radius: 5, x: 0, y: 5)
    }
}
#Preview {
    LandmarkCardView(title: "Tsutenkaku-1")
}
