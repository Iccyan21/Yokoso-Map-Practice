//
//  StationDetail.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/05/10.
//

import SwiftUI

struct StationDetail: View {
    var station: StationPoint
    var body: some View {
        VStack{
            Text(station.name)
        }
    }
}

