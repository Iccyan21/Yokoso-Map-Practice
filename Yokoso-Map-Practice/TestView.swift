//
//  TestView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/10.
//

import SwiftUI

struct TestView: View {
    @State private var showDetails: Bool = false
    var body: some View {
        VStack{
            Text(".sheetってどうやって使うねん")
            Button("シートを出す"){
                showDetails.toggle()
            }
            .sheet(isPresented: $showDetails){
                Text("yaa")
            }
        }
        
    }
}

#Preview {
    TestView()
}
