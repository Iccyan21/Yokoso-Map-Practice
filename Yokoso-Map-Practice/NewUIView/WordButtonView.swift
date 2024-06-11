//
//  WordButtonView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/10.
//

import SwiftUI

struct WordButtonView: View {
    var title: String
    var icon: String
    var color: Color
    let fixedWidth: CGFloat = 150
    var body: some View {
        HStack{
            VStack {
                Image(systemName: icon)
                    .font(.body)
                    .foregroundColor(.white)
                 
                
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                  
            }
            .padding()
            .background(color)
            .cornerRadius(10)
    
    
            VStack {
                Image(systemName: "bed.double.fill")
                    .font(.body)
                    .foregroundColor(.white)
             
                
                Text("hotel")
                    .font(.headline)
                    .foregroundColor(.white)
               
            
            }
            .padding(18)
            .padding(.horizontal,17)
            .background(color)
            .cornerRadius(10)
            
            VStack {
                Image(systemName: "bed.double.fill")
                    .font(.body)
                    .foregroundColor(.white)
                
                
                Text("Public")
                    .font(.headline)
                    .foregroundColor(.white)
                
                
            }
            .padding(18)
            .padding(.horizontal)
            .background(color)
            .cornerRadius(10)
        }
        
    }
}

#Preview {
    WordButtonView(title: "Resutalan", icon: "fork.knife", color: .orange)
}
