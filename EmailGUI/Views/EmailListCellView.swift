//
//  EmailListCellView.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import SwiftUI

// This view shows the single email cell in a list of emails view.
struct EmailListCellView: View {
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter
    }()
    
    var email: Email

    var body: some View {
        HStack(alignment: .top) {
            Image(email.sender.profilePicture)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .padding(.trailing)

            VStack(alignment: .leading, spacing: 5) {
                Text(email.sender.name)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(email.subject)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .opacity(0.7)
                Text(email.message)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            Spacer()
            Text(Self.dateFormatter.string(from: email.date))
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.trailing, 10)
        }
        .background {
            Color("TabBarBackground")
        }
    }
}
