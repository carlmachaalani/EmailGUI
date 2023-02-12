//
//  EmailView.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import SwiftUI

struct EmailView: View {
    
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
                    email.isFavorite ? Image(systemName: "star.fill").foregroundColor(.yellow) : Image(systemName: "star").foregroundColor(.yellow)
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
            }.padding([.top, .leading, .trailing])
            Spacer()
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

//struct EmailView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmailView()
//    }
//}
