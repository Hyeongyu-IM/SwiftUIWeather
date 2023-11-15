//
//  WeatherEditListItem.swift
//  SwiftUIWeatherClone
//
//  Created by 임현규 on 11/16/23.
//

import SwiftUI

struct WeatherEditListItem: View {
    enum ViewState {
        case normal
        case edit
    }
    
    @State var viewState: EditMode = .inactive
    
    init(viewState: EditMode = .inactive) {
        self.viewState = viewState
    }
    
    var body: some View {
        ZStack(content: {
            Image(.imgNight)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity,
                       height: 80,
                       alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                    Text("7º")
                        .font(.system(size: 45))
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                })
            })
            .padding(.init(top: 5, leading: 15, bottom: 5, trailing: 15))
            .frame(width: .infinity,
                   height: 80,
                   alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
    }
}
