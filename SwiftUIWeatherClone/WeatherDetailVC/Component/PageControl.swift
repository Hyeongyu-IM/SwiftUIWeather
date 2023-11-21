//
//  PageControl.swift
//  SwiftUIWeatherClone
//
//  Created by 임현규 on 11/21/23.
//

import SwiftUI

struct PageControl: View {

    @Binding var selectedPage: Int

    var pages: Int
    var circleDiameter: CGFloat
    var circleMargin: CGFloat

    private var circleRadius: CGFloat { circleDiameter / 2}
    private var pageIndex: CGFloat { CGFloat(selectedPage - 1) }

    private var currentPosition: CGFloat {
        // Get the first circle position
        let stackWidth = circleDiameter * CGFloat(pages) + circleMargin * CGFloat(pages - 1)
        let halfStackWidth = stackWidth / 2
        let iniPosition = -halfStackWidth + circleRadius

        // Calculate the distance to get the next circle
        let distanceToNextPoint = circleDiameter + circleMargin

        // Use the pageIndex to get the current position
        return iniPosition + (pageIndex * distanceToNextPoint)
    }

    var body: some View {
        ZStack {
            // Total number of pages
            HStack(spacing: circleMargin) {
                Image(systemName: "location.fill")
                    .frame(width: circleDiameter, height: circleDiameter)
                    .imageScale(.small)
                ForEach(0 ..< pages - 1) { _ in
                    Circle()
                        .frame(width: circleDiameter, height: circleDiameter)
                }
            }
            .foregroundStyle(.gray)

            // Current page index
            Circle()
                .foregroundColor(.white)
                .frame(width: circleDiameter, height: circleDiameter)
                .offset(x: currentPosition)
                .animation(.linear(duration: 0.3), value: selectedPage)
        }
    }
}
