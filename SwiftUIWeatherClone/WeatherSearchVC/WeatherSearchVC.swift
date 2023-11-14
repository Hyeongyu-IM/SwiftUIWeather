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
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            Color.black
                .ignoresSafeArea()
                .navigationTitle("날씨")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        WeatherSettingMenuButton()
                    }
                }
        }
        .searchable(text: $searchText, prompt: "도시 또는 공항 검색")
        WeatherListItem()
    }
}

#Preview {
    WeatherSearchVC()
}
