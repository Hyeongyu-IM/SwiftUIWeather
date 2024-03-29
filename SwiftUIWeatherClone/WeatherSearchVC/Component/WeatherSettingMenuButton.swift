//
//  WeatherSettingMenuButton.swift
//  SwiftUIWeatherClone
//
//  Created by 임현규 on 11/10/23.
//

import SwiftUI

struct WeatherSettingMenuButton: View {
    enum TempType: String, CaseIterable, Identifiable {
        var id: Self { return self }
        
        case Celsius = "섭씨"
        case Fahrenheit = "화씨"
        
        var image: ImageResource {
            switch self {
            case .Celsius: return .celsius
            case .Fahrenheit: return .fahrenheitDegrees
            }
        }
    }
    @State private var selectTemp: TempType = .Celsius
    @ObservedObject private var editMode: EditModeState
    
    var editButtonTap: (() -> ())?

    init(editMode: EditModeState, selectTemp: TempType = .Celsius,
         editButtonTap: (() -> ())? = nil) {
        self.selectTemp = selectTemp
        self.editMode = editMode
        self.editButtonTap = editButtonTap
    }
    
    var body: some View {
        if editMode.editMode == .inactive {
            Menu("", systemImage: "ellipsis.circle") {
                Button("목록 편집", systemImage: "pencil") {
                    print("목록편집")
                    editButtonTap?()
                }
                Button("알림", systemImage: "bell.badge") {
                    print("알림")
                }
                Divider()
                Picker(selection: $selectTemp) {
                    ForEach(TempType.allCases) { type in
                        Button("\(type.rawValue)", image: type.image, action: {
                            self.selectTemp = type
                        })
                    }
                } label: {
                    Text("온도 선택")
                }
                Divider()
                Button("단위", systemImage: "chart.bar") {
                    print("단위")
                }
                Divider()
                Button("문제 리포트", systemImage: "exclamationmark.bubble") {
                    print("문제리포트")
                }
            }
            .tint(.white)
            .preferredColorScheme(.dark)
        } else {
            Button("완료", action: {
                editButtonTap?()
            })
            .tint(.white)
        }
    }
}

extension WeatherSettingMenuButton {
    func onEditButtonTap(action: @escaping (() -> Void)) -> WeatherSettingMenuButton {
        WeatherSettingMenuButton(editMode: self.editMode, selectTemp: self.selectTemp, editButtonTap: action)
    }
}
