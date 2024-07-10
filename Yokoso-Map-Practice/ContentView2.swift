//
//  ContentView2.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/30.
//

import SwiftUI
import UIKit

struct PageView2: View {
    var imageName: String
    var title: String
    var description: String
    @Binding var currentPage: Int
    var pageIndex: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
                .padding(.horizontal)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Text(description)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding([.top, .horizontal])
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    currentPage = pageIndex + 1
                }
            }) {
                Text("Next")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .shadow(radius: 5)
            }
            .padding(.bottom, 50)
        }
        
    }
}

struct TutorialView2: View {
    @AppStorage("hasSeenTutorial") var hasSeenTutorial: Bool = false
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                PageView(imageName: "HomeLogo", title: "Welcome to Japan!", description: "Thank you for choosing this app!", currentPage: $currentPage, pageIndex: 0)
                    .tag(0)
                PageView(imageName: "HomeView", title: "App Description", description: "This app is designed to help foreign tourists have a more comfortable stay in Japan.", currentPage: $currentPage, pageIndex: 1)
                    .tag(1)
                PageView(imageName: "MapView", title: "Tourist Spots", description: "We provide information on tourist spots.", currentPage: $currentPage, pageIndex: 2)
                    .tag(2)
                PageView(imageName: "Word_Manner", title: "Basic Phrases", description: "Learn basic Japanese phrases.", currentPage: $currentPage, pageIndex: 3)
                    .tag(3)
                PageView(imageName: "Event", title: "Japanese Events", description: "Discover events and festivals in Japan.", currentPage: $currentPage, pageIndex: 4)
                    .tag(4)
                FinalPageView()
                    .tag(5)
            }
            .tabViewStyle(PageTabViewStyle())
            
            CustomPageControl(numberOfPages: 6, currentPage: $currentPage)
                .frame(height: 50)
        }
    }
}

struct CustomPageControl2: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPage = currentPage
        control.pageIndicatorTintColor = UIColor.lightGray
        control.currentPageIndicatorTintColor = UIColor.black
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }

    
    class Coordinator: NSObject {
        var parent: CustomPageControl
        
        init(_ parent: CustomPageControl) {
            self.parent = parent
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            parent.currentPage = sender.currentPage
        }
    }
}

struct FinalPageView2: View {
    @AppStorage("hasSeenTutorial") var hasSeenTutorial: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("HomeLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
                .padding(.horizontal)
            
            Text("Let's Get Started!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Text("Have a great trip")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding([.top, .horizontal])
            
            Spacer()
            
            Button(action: {
                hasSeenTutorial = true
            }) {
                Text("Start")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .shadow(radius: 5)
            }
            .padding(.bottom, 50)
        }
    }
}


#Preview {
    TutorialView2()
}
