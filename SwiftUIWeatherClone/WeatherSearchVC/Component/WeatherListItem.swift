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
    
    @ObservedObject var viewState: EditModeState
    
    init(viewState: EditModeState) {
        self.viewState = viewState
    }
    
    var body: some View {
        ZStack(content: {
            Image(.imgNight)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity,
                       height: viewState.editMode == .inactive ? 105 : 60,
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
                if viewState.editMode == .inactive {
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
                }
            })
            .padding(.init(top: 5, leading: 15, bottom: 5, trailing: 15))
            .frame(width: .infinity,
                   height: viewState.editMode == .inactive ? 105 : 60,
                   alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
        .animation(.snappy(duration: 0.5, extraBounce: 0), value: viewState.editMode == .inactive)
    }
}
