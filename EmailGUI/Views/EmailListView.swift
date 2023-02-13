//
//  EmailListView.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import SwiftUI

// This view displays the list of emails
struct EmailListView: View {
    
    @EnvironmentObject var emailViewModel: EmailViewModel
    
    // we set showSheet to true when the user taps on an email to see email details
    @State private var showSheet = false
    // we set selectedEmail to the email that the user taps on to see its details
    @State private var selectedEmail: Email?

    var body: some View {
        // List of emails
        ScrollView {
            HStack {
                Text("Today").font(.system(size: 25)).fontWeight(.bold)
                Spacer()
            }
            VStack(spacing: 10) {
                // go over list of emails and display each
                ForEach(emailViewModel.emails) { email in
                    EmailListCellView(email: email)
                        // when a user taps on an email, set showSheet to true and selectedEmail to the email tapped.
                        .onTapGesture {
                            selectedEmail = email
                            showSheet = true
                        }
                    Divider()
                }
            }
        }
        // show sheet when the user taps on an email to see details
        .sheet(isPresented: $showSheet) {
            if let email = selectedEmail {
                EmailSheetView(email: email)
            } else {
                EmailSheetView(email: emailViewModel.emails.first!)
            }
        }
    }
}

struct EmailListiew_Previews: PreviewProvider {
    static var previews: some View {
        EmailListView()
    }
}
