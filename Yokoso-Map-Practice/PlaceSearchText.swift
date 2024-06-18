//
//  PlaceSearchText.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/06.
//

import SwiftUI

struct PlaceSearchText: View {
    
    
    var body: some View {
        VStack{
            HStack(alignment: .top) {
                Image("Tsutenkaku-1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Tsutenkaku")
                            .font(.headline)
                            .fontWeight(.bold)
                        Spacer()
                        Text("Kankouchi")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Text("Built in 1912 (1912) modeled after the Eiffel Tower in Paris, Osaka's symbol Tsutenkaku, which is known throughout the country, means ``tower leading to heaven,'' and the current Tsutenkaku is the second generation.")
                        .font(.body)
                        .lineLimit(3)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
          
        }
    }
}

#Preview {
    PlaceSearchText()
}
