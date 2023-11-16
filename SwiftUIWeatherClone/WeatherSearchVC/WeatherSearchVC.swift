//
//  WeatherSearchVC.swift
//  SwiftUIWeatherClone
//
//  Created by 임현규 on 11/10/23.
//

import SwiftUI

class EditModeState: ObservableObject {
    @Published var editMode: EditMode = .inactive
    
    init(editMode: EditMode = .inactive) {
        self.editMode = editMode
    }
}

struct WeatherSearchVC: View {
    @State private var mockCityList: [String] = ["나의 위치", "서울특별시", "서울", "런던", "용산구", "나의 위치", "서울특별시", "서울", "런던", "용산구"]
    @State private var searchText = ""
    @State private var animating: Bool = false
    
    @ObservedObject var editMode = EditModeState()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(content: {
            NavigationView {
                List {
                    ForEach(mockCityList, id: \.self) { item in
                        WeatherListItem(viewState: editMode)
                            .onDrag({
                                return .init()
                            }, preview: {
                                WeatherListItem(viewState: editMode)
                                    .frame(minWidth: editMode.editMode == .active 
                                           ? (screenWidth - 110)
                                           : (screenWidth - 30),
                                           minHeight: editMode.editMode == .active
                                           ? 60 : 105)
                                    .contentShape(.dragPreview, RoundedRectangle(cornerRadius: 15, style: .continuous))
                            })
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: moveFriut)
                    .listRowSeparator(.hidden)
                }
                .listRowSpacing(-10)
                .environment(\.editMode, $editMode.editMode)
                .navigationTitle("날씨")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        WeatherSettingMenuButton(editMode: editMode)
                            .onEditButtonTap {
                                editButtonTab()
                            }
                    }
                }
                .listStyle(.plain)
                .padding(.init(top: -10, leading: 0, bottom: 0, trailing: 0))
                .animation(.snappy(duration: 0.4, extraBounce: 0), value: editMode.editMode == .inactive)
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
        editMode.editMode = editMode.editMode == .active ? .inactive : .active
        
    }
}

#Preview {
    WeatherSearchVC()
}
