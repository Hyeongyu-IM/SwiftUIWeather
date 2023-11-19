//
//  WeatherDetailVC.swift
//  SwiftUIWeatherClone
//
//  Created by 임현규 on 11/19/23.
//

import SwiftUI

struct WeatherDetailVC: View {
    var body: some View {
        // NavigationView를 사용하여 NavigationBar를 제거할 수 있습니다.
                NavigationView {
                    // ZStack을 사용하여 여러 뷰를 겹칠 수 있습니다.
                    ZStack {
                        // 배경에 하얀색을 지정합니다.
                        Color.white
                            .edgesIgnoringSafeArea(.all) // SafeArea를 무시하여 전체 화면을 채웁니다.
                        
                        // 여기에 다른 내용을 추가할 수 있습니다.
                        Text("Hello, World!")
                            .foregroundColor(.black) // 텍스트 색상을 지정합니다.
                    }
                    .navigationBarHidden(true) // NavigationBar를 숨깁니다.
                }
    }
}

#Preview {
    WeatherDetailVC()
}
