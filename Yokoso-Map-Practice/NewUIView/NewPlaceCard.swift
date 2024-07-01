//
//  SwiftUIView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/30.
//

import SwiftUI

struct NewPlaceCardView: View {
    var imageName: String = "Tsutenkaku-1"
    var title: String = "Tsutenkaku"
    var distance: String = "120m"
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 180, height: 300)
                .clipped()
                .cornerRadius(10)
            
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.6)]),
                startPoint: .center,
                endPoint: .bottom
            )
            .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding([.bottom], 2)
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.white)
                    Text(distance)
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
        .frame(width: 180, height: 300)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    NewPlaceCardView()
}
