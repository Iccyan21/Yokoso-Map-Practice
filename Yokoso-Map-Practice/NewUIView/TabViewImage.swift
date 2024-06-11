//
//  TabViewImage.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/10.
//

import SwiftUI

struct TabViewImage: View {
    var itemImages = ["Tsutenkaku-1", "Tsutenkaku-2", "Tsutenkaku-3"]
    
    var body: some View {
        
        TabView {
            ForEach(itemImages, id: \.self) { imageName in
                ZStack(alignment: .bottomLeading) {
                    Image(imageName)
                        .resizable()
                        .cornerRadius(10)
                  
                        
                    
                    VStack(alignment: .leading) {
                        Text("YodogawaHanabi")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        HStack {
                            Image(systemName: "map")
                                .foregroundColor(.white)
                            Text("Osaka")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal,10)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
                    .padding([.leading, .bottom], 10) // Ensure padding to the bottom and left
                }
            }
        }
        .frame(height: 175)
        .cornerRadius(10)
        .tabViewStyle(PageTabViewStyle())
        
    }
}


#Preview {
    TabViewImage()
}
