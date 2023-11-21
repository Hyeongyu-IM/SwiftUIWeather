//
//  WeatherDetailItem.swift
//  SwiftUIWeatherClone
//
//  Created by 임현규 on 11/21/23.
//

import SwiftUI

struct WeatherDetailItem: View {
    
    var body: some View {
        VStack(content: {
            VStack(content: {
                Text("서울")
                Text("6º")
                Text("청명함")
                Text("최고:14º 최저:0º")
            })
        })
    }
}

#Preview {
    WeatherDetailItem()
}
