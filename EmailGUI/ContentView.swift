//
//  ContentView.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import SwiftUI

struct ContentView: View {
    @State var isOpen: Bool = true
    var body: some View {
        VStack {
            Text("Open the thing").onTapGesture {
                isOpen = !isOpen
            }
        }.sheet(isPresented: $isOpen) {
            VStack {
                EmailView(email: getMockEmails().first!)
            }
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
