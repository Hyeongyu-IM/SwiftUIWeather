//
//  WeatherListItem.swift
//  SwiftUIWeatherClone
//
//  Created by 임현규 on 11/13/23.
//

import SwiftUI

struct WeatherListItem: View {
    enum ViewState {
        case normal
        case edit
    }
    
    @State private var viewState: ViewState = .normal
    
    var body: some View {
        ZStack(content: {
            Image(.imgNight)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity, height: 115, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .clipped()
            VStack(content: {
                HStack(content: {
                    VStack(alignment: .leading, content: {
                        Text("나의 위치")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundStyle(.white)
                        Text("서울특별시")
                            .font(.system(size: 15))
                            .bold()
                            .foregroundStyle(.white)
                    })
                    Spacer()
                    Text("6º")
                        .font(.system(size: 40))
                        .foregroundStyle(.white)
                })
                Spacer()
                HStack(content: {
                    Text("대체로 흐림")
                        .font(.system(size: 15))
                        .foregroundStyle(.white)
                    Spacer()
                    Text("최고:10º 최저:-2º")
                        .font(.system(size: 15))
                        .foregroundStyle(.white)
                })
            })
            .padding(.init(top: 15, leading: 15, bottom: 15, trailing: 15))
            .frame(width: .infinity, height: 115, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
        .padding(.init(top: 5, leading: 15, bottom: 5, trailing: 15))
    }
}

#Preview {
    WeatherListItem()
}
