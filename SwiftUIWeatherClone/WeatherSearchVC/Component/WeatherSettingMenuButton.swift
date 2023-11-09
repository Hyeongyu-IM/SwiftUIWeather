//
//  WeatherSettingMenuButton.swift
//  SwiftUIWeatherClone
//
//  Created by 임현규 on 11/10/23.
//

import SwiftUI

struct WeatherSettingMenuButton: View {
    var body: some View {
        Menu("", systemImage: "square.and.arrow.down.fill") {
            Button("목록편집") {
                print("목록편집")
            }
            Button("알림") {
                print("알림")
            }
            Button("섭씨") {
                print("섭씨")
            }
            Button("화씨") {
                print("화씨")
            }
            Button("단위") {
                print("단위")
            }
            Button("문제 리포트") {
                print("문제리포트")
            }
        }
        .background(.black)
    }
}
