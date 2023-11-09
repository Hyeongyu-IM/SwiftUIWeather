//
//  WeatherSearchVC.swift
//  SwiftUIWeatherClone
//
//  Created by 임현규 on 11/10/23.
//

import SwiftUI

struct WeatherSearchVC: View {
    @State private var mockCityList: [String] = ["나의 위치", "서울특별시", "서울", "런던", "용산구"]
    @State private var searchText = ""
    
    init() {
        let attributeStyle = NSMutableParagraphStyle()
        attributeStyle.alignment = .right

        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        VStack(spacing: 0, content: {
            HStack(alignment: .lastTextBaseline, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Spacer()
                WeatherSettingMenuButton()
            })
            .frame(width: .infinity, height: 50, alignment: .center)
            .padding(.vertical, 20)
            .background(.white)
            NavigationStack {
                Color.black
                    .ignoresSafeArea()
                    .navigationTitle("날씨")
            }
            .searchable(text: $searchText, prompt: "도시 또는 공항 검색")
            .frame(width: .infinity, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
        })
        .ignoresSafeArea()
    }
}

#Preview {
    WeatherSearchVC()
}
