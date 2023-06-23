//
//  ContentView.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import SwiftUI

struct ContentView: View {
    
    // This viewRouter allows us to know which view we're currently at (Mail or Settings tab)
    @StateObject var viewRouter = ViewRouter()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                // Main View
                switch viewRouter.currentPage {
                    case .setting:
                        Text("Settings")
                    case .mails:
                        MailsView()
                }
                
                Spacer()
                
                // Bottom Menu Bar
                ZStack {
                    HStack {
                        Spacer()
                        
                        // Mails Icon
                        TabBarIconView(viewRouter: viewRouter, assignedPage: .mails, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "envelope", tabName: "Mails")
                        Spacer()
                        
                        // Edit Blue Button
                        ZStack {
                            Circle()
                                .foregroundColor(Color("TabBarBackground"))
                                .frame(width: geometry.size.width/5, height: geometry.size.width/5)
                            Circle()
                                .foregroundColor(.blue)
                                .frame(width: geometry.size.width/6, height: geometry.size.width/6)
                                .shadow(color: Color("Shadow").opacity(0.4), radius: 15)
Image(systemName: "questionmark.circle")
                                .resizable()
                                .bold()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/10-9 , height: geometry.size.width/10-9)
                                .foregroundColor(.white)
                        }
                            .offset(y: -geometry.size.height/8/2)
                        Spacer()
                        
                        // Settings Icon
                        TabBarIconView(viewRouter: viewRouter, assignedPage: .setting, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "gearshape", tabName: "Settings")
                        Spacer()
                    }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmailGUIApp()
    }
}
