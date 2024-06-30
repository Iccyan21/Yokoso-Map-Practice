//
//  NewEreaCard.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/30.
//

import SwiftUI

struct NewEreaCard: View {
    @State private var showFullText = false
    
    var body: some View {
        VStack {
            Image("Tsutenkaku-1")
                .resizable()
                .frame(width: 380, height: 250)
                .scaledToFit()
                .cornerRadius(10)
            HStack {
                Text("Tsutenkaku")
                    .font(.title)
                Spacer()
            }
            Text(showFullText ? fullDescription : shortDescription)
                .lineLimit(showFullText ? nil : 3)
                .animation(.easeInOut, value: showFullText)
            
            Button(action: {
                showFullText.toggle()
            }) {
                Text(showFullText ? "Show less" : "Read more")
                    .foregroundColor(.blue)
                    .padding(.top, 5)
            }
        }
        .padding()
    }
    
    private var fullDescription: String {
        "DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescrDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescr"
    }
    
    private var shortDescription: String {
        String(fullDescription.prefix(100)) + "..." // 適宜カットオフの長さを設定
    }
}

struct NewEreaCard_Previews: PreviewProvider {
    static var previews: some View {
        NewEreaCard()
    }
}

