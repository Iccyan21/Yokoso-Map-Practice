//
//  HomeView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/09.
//

import SwiftUI

struct HomeView: View {
    @State var inputText = ""
    var body: some View {
        ScrollView {
            VStack{
                // TopBarView
                ZStack{
                    Image("HomeTopView")
                        .resizable()
                        .frame(height: 320)
                        .scaledToFit()
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("ようこそ！")
                            .font(.title)
                            .padding(.horizontal,12)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("日本へ！")
                            .font(.title)
                            .padding(.horizontal,12)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        HStack{
                            Image("HomeLogo")
                                .resizable()
                                .frame(width: 75,height:  75)
                            
                            VStack{
                                Image(systemName: "sun.min")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 50,height:  50)
                                HStack{
                                    Text("26°")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    Text("72%")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                            } .background(Color.black.opacity(0.5))
                                .cornerRadius(10)
                            
                            Spacer()
                        } // Hstack
                        .padding(.top,10)
                        
                        TextField("Place Event",text: $inputText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .cornerRadius(10)
                    }// VStack
                    .padding(.top,60)
                } // ZStack
                
                // EventTabView
                VStack(alignment: .leading, spacing: 10){
                    Text("Week Event!!")
                        .font(.title)
                        .fontWeight(.bold) 
                        .fontWeight(.bold)
                    
                    TabViewImage()
                        
                } // EventTabView
                .padding(.top,20)
                .padding(.horizontal)
                .padding(.bottom,50)
                
                // WordMannerView
                // Word Manner
                VStack(alignment: .leading, spacing: 10) {
                    Text("Communication in trouble?")
                        .font(.title2)
                        .padding(.horizontal,-60)
                        .fontWeight(.bold)
                        .padding(.bottom,10)
                    
                    HStack{
                        VStack {
                            Image(systemName: "fork.knife")
                                .font(.body)
                                .foregroundColor(.white)
                            
                            Text("Restaurant")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                            
                        }
                        .padding()
                        .background(.orange)
                        .cornerRadius(10)
                        
                        
                        VStack {
                            Image(systemName: "bed.double.fill")
                                .font(.body)
                            
                                .foregroundColor(.white)
                            
                            
                            Text("Hotel")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                            
                            
                        }
                        .padding(18)
                        .padding(.horizontal,17)
                        .background(.blue)
                        .cornerRadius(10)
                        
                        VStack {
                            Image(systemName: "globe")
                                .font(.body)
                                .foregroundColor(.white)
                            
                            
                            Text("Public")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            
                            
                        }
                        .padding(18)
                        .padding(.horizontal)
                        .background(.yellow)
                        .cornerRadius(10)
                    }.padding(.horizontal,-60)
                    HStack{
                        VStack {
                            Image(systemName:  "car.fill")
                                .font(.body)
                                .foregroundColor(.white)
                            
                            
                            Text("Trafic")
                                .font(.footnote)
                                .foregroundColor(.white)
                            
                            
                        }
                        .padding(18)
                        .padding(.horizontal,17)
                        .background(.red)
                        .cornerRadius(10)
                        
                        VStack {
                            Image(systemName: "message.fill")
                                .font(.body)
                                .foregroundColor(.white)
                            
                            
                            Text("Day Life")
                                .font(.footnote)
                                .foregroundColor(.white)
                            
                            
                        }
                        .padding(18)
                        .padding(.horizontal)
                        .background(.green)
                        .cornerRadius(10)
                    }.padding(.horizontal,-60)
                    
                    Spacer()
                } // WordManner
                .padding(.top,-40)
                
                
                // EreaCard
                VStack(alignment: .leading) {
                    Text("Erea")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0..<3) { index in
                                NewEreaCard()
                                    .frame(width: 380) // 固定幅を設定
                                    .padding(.trailing, index == 2 ? 20 : 0)
                            }
                        }
                    }.padding(.top,-20)
                }.padding(.horizontal)
                
                // PlaceCard
                VStack(alignment: .leading) {
                    Text("Place")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20){
                            ForEach(0..<3) { index in
                                NewPlaceCardView()
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom,20)
                    }
                }
                .padding(.top)
                .padding(.horizontal,25)
                
                
                // FoodCard
                VStack(alignment: .leading) {
                    Text("Food")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20){
                            ForEach(0..<3) { index in
                                LandmarkCardView(title: "Tsutenkaku")
                            }
                        }
                        .padding()
                    }
                }
                .padding(.top)
                .padding(.horizontal,30)
            }
            
        }
        .ignoresSafeArea(edges: .top)
    }
    func imageName(for index: Int) -> String {
        // サンプル画像名を返す
        switch index {
        case 0: return "Tsutenkaku-1"
        case 1: return "Tsutenkaku-2"
        case 2: return "Tsutenkaku-3"
        default: return ""
        }
    }
    
    func cityName(for index: Int) -> String {
        // サンプル都市名を返す
        switch index {
        case 0: return "Osaka"
        case 1: return "Kyoto"
        case 2: return "Kobe"
        default: return ""
        }
    }
}

struct WordButton: View {
    var title: String
    var icon: String
    var color: Color
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.white)
      
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}

struct CardView: View {
    let imageName: String
    let cityName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 135, height: 200)
                .clipped()
                .cornerRadius(10)
            Text(cityName)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, -30)
                .padding(.horizontal, 10)
        }
        .background(Color.black.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct PlaceCardView: View {
    let place: Place
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(place.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 180)
                .clipped()
                .cornerRadius(10)
            
            VStack{
                Text(place.title)
                    .font(.headline)
                    .padding(.top, 5)
                
                
                Text(place.city)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(place.distance)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
            }
            .padding(.horizontal,10)
            
            
        }
        .frame(width: 150,height: 350)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct Place {
    let imageName: String
    let title: String
    let city: String
    let distance: String
}

let places = [
    Place(imageName: "Tsutenkaku-1", title: "Tsutenkaku", city: "Osaka", distance: "126m"),
    Place(imageName: "Tsutenkaku-2", title: "Osaka Castle", city: "Osaka", distance: "1.2km"),
    Place(imageName: "Tsutenkaku-3", title: "Ebisu Brichi", city: "Osaka", distance: "190m")
]

#Preview {
    HomeView()
}
