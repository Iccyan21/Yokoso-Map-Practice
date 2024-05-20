//
//  NewTestView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/18.
//

import SwiftUI

struct NewTestView: View {
    
    let images = ["Tsutenkaku-1", "Tsutenkaku-2", "Tsutenkaku-3"]
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("SyuSyu")
                    .font(.largeTitle)
                Text("Japanese-Izakaya")
                    .font(.headline)
            }
            HStack{
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.green)
                Text("11:00 ~ 22:00")
            }
            HStack{
                Text("¥2000 - ¥5000")
                    .padding()
                    .padding(.trailing, 5)
                
                Text("Freinds")
                    .padding(.vertical, 4)
                    .padding(.horizontal, 10)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .background(
                        Capsule()
                            .fill(Color.blue)
                            .padding(.trailing, -3)
                            .padding(.bottom, -5)
                    )
                    .foregroundColor(.black)
               
                
                Text("Caple")
                    .padding(.vertical, 4)
                    .padding(.horizontal, 10)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .background(
                        Capsule()
                            .fill(Color.blue)
                            .padding(.trailing, -3)
                            .padding(.bottom, -5)
                    )
                    .foregroundColor(.black)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(images, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 150)
                            .clipped()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 5) // 黒枠を追加
                            )
                            
                    }
                }
                .padding(.horizontal,5)
            }.padding(.bottom, 15)
            
            Text("Built in 1912 (1912) modeled after the Eiffel Tower in Paris, Osaka's symbol Tsutenkaku, which is known throughout the country, means ``tower leading to heaven,'' and the current Tsutenkaku is the second generation.")
                .font(.body)
                .padding(.bottom, 20)
                .padding(.horizontal,5)
            
            Text("Access")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
            
            HStack {
                Text("Shinimamiya Station")
                    .font(.caption)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading) // 左揃えに設定
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 4) // 太枠を追加
                    )
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading) // HStack全体を左揃えに設定
            .padding(.bottom, 20)
            
       
            Spacer()
            
        }
        .padding(.horizontal,5)
        .padding(.leading, 20).padding(.top,30).padding(.trailing, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    NewTestView()
}
