//
//  EmailView.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import SwiftUI

// This view shows the details of an email given an Email object. It is shown when the user taps on an email in the email list.
struct EmailSheetView: View {
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

    let email: Email
    
    var body: some View {
        VStack(alignment: .center) {
            
            Divider().frame(width: 33).frame(minHeight: 3).background(Color.gray.opacity(0.2)).cornerRadius(20)
            
            // Email Content
            VStack(alignment: .leading) {
                
                // Title
                HStack {
                    Text(email.subject).font(.largeTitle).fontWeight(.bold).padding(.trailing, 10.0)
                    Spacer()
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                }
                Text(Self.dateFormatter.string(from: email.date))
                    .font(.subheadline)
                    .foregroundColor(.gray).padding(.bottom)
                
                // Sender Info
                HStack {
                    Image(email.sender.profilePicture)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(email.sender.name).font(.headline)
                        Text(email.sender.email).font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("...").padding(.trailing)
                }.padding(.bottom)
                
                // Message
                Text(email.message).font(.system(size: 15))
                Text("\nBest,").font(.system(size: 15))
                Text(email.sender.name).font(.system(size: 15))
                
            }.padding([.top, .leading, .trailing])
            Spacer()
            
            // Bottom Navigation
            HStack {
                VStack {
                    Image(systemName: "arrow.uturn.forward")
                    Text("Forward")
                }
                Spacer()
                VStack {
                    Image(systemName: "arrowshape.turn.up.left")
                    Text("Reply")
                }
                Spacer()
                VStack {
                    Image(systemName: "arrowshape.turn.up.left.2.fill")
                    Text("Reply All")
                }
                Spacer()
                VStack {
                    Image(systemName: "trash")
                    Text("Delete")
                }
            }.padding().background(.black).cornerRadius(20).padding().foregroundColor(.white)
        }.padding([.top, .leading, .trailing])
    }
}
