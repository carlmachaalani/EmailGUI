//
//  TabBarIconView.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import SwiftUI

// This View is used in the Bottom Menu bar. It takes in the icon name and page to which the icon routes to and build the view of the tab bar icon
struct TabBarIconView: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String

    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
            .padding(.horizontal, -4)
            .onTapGesture {
                viewRouter.currentPage = assignedPage
            }
            .foregroundColor(viewRouter.currentPage == assignedPage ? Color("TabBarHighlight") : .gray)
    }
}
