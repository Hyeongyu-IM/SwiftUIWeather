//
//  WeatherSearchVC.swift
//  SwiftUIWeatherClone
//
//  Created by 임현규 on 11/10/23.
//

import SwiftUI

struct WeatherSearchVC: View {
    @State private var mockCityList: [String] = ["나의 위치", "서울특별시", "서울", "런던", "용산구", "나의 위치", "서울특별시", "서울", "런던", "용산구"]
    @State private var searchText = ""
    @State private var editMode: EditMode = .inactive
    
    @State private var animating: Bool = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        VStack(content: {
            NavigationView {
                List {
                    ForEach(mockCityList, id: \.self) { item in
                        ZStack(content: {
                            Image(.imgNight)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: .infinity,
                                       height: editMode == .inactive ? 105 : 60,
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
                                if editMode == .inactive {
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
                                   height: editMode == .inactive ? 105 : 60,
                                   alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: moveFriut)
                    .listRowSeparator(.hidden)
                }
                .listRowSpacing(-10)
                .environment(\.editMode, $editMode)
                .navigationTitle("날씨")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        WeatherSettingMenuButton()
                            .onEditButtonTap {
                                editButtonTab()
                            }
                    }
                }
                .listStyle(.plain)
                .padding(.init(top: -10, leading: 0, bottom: 0, trailing: 0))
                .animation(.snappy(duration: 0.4, extraBounce: 0), value: editMode == .inactive)
            }
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "도시 또는 공항 검색")
        })
    }
    
    func delete(at offsets: IndexSet) {
        mockCityList.remove(atOffsets: offsets)
    }
    func moveFriut(from source: IndexSet, to destination: Int) {
        mockCityList.move(fromOffsets: source, toOffset: destination)
    }
    func editButtonTab() {
        animating.toggle()
        editMode = editMode == .active ? .inactive : .active
        
    }
}

#Preview {
    WeatherSearchVC()
}
