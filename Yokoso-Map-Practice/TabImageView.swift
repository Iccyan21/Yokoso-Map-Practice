//
//  TabImageView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/17.
//

import SwiftUI

struct TabImageView: View {
    var itemImages = ["Tsutenkaku-1", "Tsutenkaku-2", "Tsutenkaku-3"]
    
    var body: some View {
        
        TabView {
            ForEach(itemImages, id: \.self) { imageName in
                ZStack(alignment: .bottomLeading) {
                    Image(imageName)
                        .resizable()
                        .cornerRadius(10)
                    
                }
            }
        }
        .frame(height: 250)
        .cornerRadius(10)
        .tabViewStyle(PageTabViewStyle())
        
    }
}

#Preview {
    TabImageView()
}
