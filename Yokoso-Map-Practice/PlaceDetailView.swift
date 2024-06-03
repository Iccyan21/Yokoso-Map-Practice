//
//  PlaceDetailView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/01.
//

import SwiftUI
import MapKit

struct PlaceDetailView: View {
    let current_location:  CLLocationCoordinate2D
    var place: PlaceModel
    // 経路を案内するボタンを押したときに実行されるクロージャ
    // ユーザーがボタンを押したときに経路計算を開始するためのアクションを実行
    var onRouteRequested: () -> Void
    
    var onTransportOptionsRequested: () -> Void
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text(place.place_name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom,8)
            
            Text("Japanese-Izakaya")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom,8)
            
            
            HStack{
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.green)
                Text("11:00 ~ 22:00")
                    .fontWeight(.bold)
            }
            HStack{
                Text("¥2000 - ¥5000")
                    .padding()
                    .padding(.trailing, 5)
                    .fontWeight(.bold)
                
                Text("Freinds")
                    .padding(.vertical, 4)
                    .padding(.horizontal, 10)
                    .fontWeight(.bold)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .background(
                        Capsule()
                            .fill(Color.blue)
                            .padding(.trailing, -4)
                            .padding(.bottom, -6)
                    )
                    .foregroundColor(.black)
                
                
                Text("Caple")
                    .padding(.vertical, 4)
                    .padding(.horizontal, 10)
                    .fontWeight(.bold)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .background(
                        Capsule()
                            .fill(Color.blue)
                            .padding(.trailing, -4)
                            .padding(.bottom, -6)
                    )
                    .foregroundColor(.black)
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    ForEach(place.place_images, id: \.self) { image in
                        // urlから表示なのでImageは使わず、AsyncImageを使用
                        AsyncImage(url: URL(string: image)){ imageurl in
                            if let image = imageurl.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 150)
                                    .clipped()
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 5) // 黒枠を追加
                                    )
                            } else if imageurl.error != nil {
                                // エラー時のプレースホルダー
                                Color.red
                                    .frame(width: 200, height: 150)
                                    .cornerRadius(10)
                            } else {
                                // ローディング時のプレースホルダー
                                Color.gray
                                    .frame(width: 200, height: 150)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }.padding(.horizontal,5)
            }.padding(.bottom, 15)
            
            Text(place.place_description)
                .font(.body)
                .padding(.bottom, 20)
                .padding(.horizontal,5)
            
            Text("Access")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
            HStack{
                Text("Shinimamiya Station")
                    .font(.body)
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
            
            HStack{
                Spacer()
                
                // 経路案内ボタン
                // ここデザイン変更いる
                Button(action: {
                    onRouteRequested()
                    onTransportOptionsRequested()
                }) {
                    Text("Go Here")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .fontWeight(.bold)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .background(
                            Capsule()
                                .fill(Color.black)
                                .padding(.trailing, -4)
                                .padding(.bottom, -6)
                        )
                        .foregroundColor(.black)
                }
                
            }
            
            Spacer()
            
        }
        .padding(.horizontal,5)
        .padding(.leading, 20).padding(.top,30).padding(.trailing, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// Viewの表示確認したかったら、これのコメントアウト消して
// let place コメントアウトする
//#Preview {
//    PlaceDetailView()
// }
