//
//  NewPlaceView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/17.
//

import SwiftUI

struct NewPlaceView: View {
    var body: some View {
        ScrollView{
            VStack{
                TabImageView()
                
                HStack{
                    Text("Tsutenkaku")
                        .font(.largeTitle)
                        
                    Spacer()
                    Text("Kankouchi")
                        .font(.headline)
                        .fontWeight(.bold)
                }.padding(.horizontal)
                
                HStack{
                    Circle()
                        .frame(width: 20)
                        .foregroundColor(Color.green)
                    Text("Open")
                        .fontWeight(.bold)
              
                    Spacer()
                }.padding(.horizontal)
                
                HStack{
                    Text("0¥")
                        .padding(.horizontal)
                    Text("All")
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .background(
                            Capsule()
                                .fill(Color.gray)
                                .padding(.trailing, -4)
                                .padding(.bottom, -6)
                        )
                        .foregroundColor(.black)
                    
                    Spacer()
                }.padding(.horizontal)
                
                LazyVStack{
                    Text("Osaka Castle was originally the site of Osaka Honganji Temple (Ishiyama Honganji Temple) during the Warring States period, and has always had a deep connection with Japanese history, including the Ishiyama Battle against Oda Nobunaga, construction by Toyotomi Hideyoshi, the fall of the castle during the Osaka Battle, reconstruction by the Tokugawa Shogunate, destruction by fire during the upheavals of the Meiji Restoration, jurisdiction by the Army after the Meiji Restoration, and park development after the war.")
                        .font(.body)
                        .padding(.bottom, 20)
                        .padding(.horizontal,15)
                }
            }
        }.ignoresSafeArea(edges: .top)
    }
}

#Preview {
    NewPlaceView()
}
