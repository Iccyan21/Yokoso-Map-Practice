//
//  SearchView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/07/18.
//

import SwiftUI
import MapKit


struct SearchView: View {
    @State private var selectedCategory: String?
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                Text("Where to?")
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CategoryView(iconName: "sparkles", text: "TravelSpot", selectedCategory: $selectedCategory)
                    CategoryView(iconName: "umbrella", text: "Food", selectedCategory: $selectedCategory)
                    CategoryView(iconName: "waveform.path.ecg", text: "Ramen", selectedCategory: $selectedCategory)
                    CategoryView(iconName: "square.and.arrow.up", text: "Islands", selectedCategory: $selectedCategory)
                    CategoryView(iconName: "house", text: "Amazing", selectedCategory: $selectedCategory)
                }
                .padding(.horizontal)
            }
            Map()
                .mapControls {
                    MapUserLocationButton()
                }
        }
        .padding(.top)
    }
}

struct CategoryView: View {
    var iconName: String
    var text: String
    @Binding var selectedCategory: String?
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .foregroundColor(.black)
                .padding()
                .background(Color(.systemGray6))
                .clipShape(Circle())
                .onTapGesture {
                    selectedCategory = text
                }
            Text(text)
                .foregroundColor(.black)
                .font(.footnote)
            if selectedCategory == text {
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.black)
            } else {
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.clear)
            }
        }
        .padding(.horizontal, 10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

