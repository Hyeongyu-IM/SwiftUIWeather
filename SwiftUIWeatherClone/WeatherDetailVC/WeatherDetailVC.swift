//
//  WeatherDetailVC.swift
//  SwiftUIWeatherClone
//
//  Created by 임현규 on 11/19/23.
//

import SwiftUI

struct WeatherDetailVC: View {
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            Image(.imgSnow)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(minHeight: 0, maxHeight: .infinity)
            
            VStack(content: {
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top, content: {
                        ForEach(1...10, id: \.self) { count in
                            /*@START_MENU_TOKEN@*/Text("Placeholder \(count)")/*@END_MENU_TOKEN@*/
                        }
                    })
                }
                HStack(content: {
                    Button("", systemImage: "map", action: {})
                        .tint(.white)
                        .imageScale(.large)
                        .padding(.leading, 16)
                    Spacer()
                    PageControl(selectedPage: .constant(3), pages: 5,
                                circleDiameter: 8, circleMargin: 11.0)
                        .frame(height: 50)
                    Spacer()
                    Button("", systemImage: "list.bullet", action: {})
                        .tint(.white)
                        .imageScale(.large)
                        .padding(.trailing, 16)
                })
                .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width)
                .background(.ultraThinMaterial)
                .preferredColorScheme(.dark)
            })
        })
    }
}

#Preview {
    WeatherDetailVC()
}
