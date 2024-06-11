//
//  MapView-Test.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/03.
//


import SwiftUI

struct HomeView2: View {
    @State var inputText = ""
    var body: some View {
        ScrollView {
            VStack{
                ZStack{
                    Image("HomeTopView")
                        .resizable()
                        .frame(width: 400, height: 300)
                        .scaledToFit()
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("ようこそ！")
                        
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("日本へ！")
                            .font(.title)
                            .padding(.horizontal,10)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        HStack{
                            Image("HomeLogo")
                                .resizable()
                                .frame(width: 75,height:  75)
                            
                            VStack{
                                Image(systemName: "sun.min")
                                    .resizable()
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
                    }
                } // Zstack
                
                // EventTabView
                // 岩下担当
                VStack(alignment: .leading, spacing: 10){
                    Text("Week Event!!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    TabView{
                        ForEach(0..<5){ index in
                            ZStack(alignment: .bottomLeading){
                                Image("Tsutenkaku-1")
                                    .resizable()
                                    .frame(height: 195)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading){
                                    Text("YodogawaHanabi")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    HStack{
                                        Image(systemName: "map")
                                            .foregroundColor(.white)
                                        Text("Osaka")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                    }
                                }// VStack
                                .padding(.horizontal,10)
                                .padding(.top,10)
                                .padding(.bottom,10)
                                .background(Color.black.opacity(0.5))
                                .cornerRadius(10)
                            } // Zstack
                            
                        } // For
                    } // TabView
                    // なんで表示されないか不明ゴミしよう
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    
                    .frame(height: 300)
                    .padding(.top,-50)
                } // EventTabView
                .padding(.top,20)
                .padding(.horizontal,30)
                
                // Word Manner
                VStack(alignment: .leading, spacing: 10) {
                    Text("Communication in trouble?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .padding(.horizontal, 30)
                    
                    HStack {
                        WordButton(title: "Restaurant", icon: "fork.knife", color: .orange)
                        WordButton(title: "Hotel", icon: "bed.double.fill", color: .blue)
                        WordButton(title: "Public", icon: "globe", color: .yellow)
                    }
                    .padding(.horizontal, 30)
                    
                    HStack {
                        WordButton(title: "Traffic", icon: "car.fill", color: .red)
                        WordButton(title: "Day Life", icon: "message.fill", color: .gray)
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer()
                }
                .padding(.horizontal,30)
                Spacer()
            } // VStack
        }
    }
}

struct WordButton2: View {
    var title: String
    var icon: String
    var color: Color
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}

#Preview {
    HomeView2()
}
