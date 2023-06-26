//
//  MailsView.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import SwiftUI

// This is the view that shows when the user is on the "Mails" tab
struct MailsView: View {

    @ObservedObject var emailViewModel = EmailViewModel()
    
@State var searchTerm: String = "Email, Name, etc..."
private func filterMails() { emailViewModel.filterMails(searchTerm: searchTerm)}

var body: some View {

                    Image(systemName: "circle.fill")
                    .padding(.trailing, 8)
     .background(Color(.systemGray6))
            .cornerRadius(30)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            // Logos
            HStack {
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                        
                        Image("logo-apple")
                            .resizable()
                            .frame(width: 55, height: 55)
                    }
                    Text("iCloud")
                }
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 50, height: 50)
                        
                        Image("google-logo")
                            .resizable()
                            .frame(width: 55, height: 55)
                    }
                    Text("Gmail")
                }.padding(.horizontal)
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 50, height: 50)
                        
                        Image("outlook-logo")
                            .resizable()
                            .frame(width: 55, height: 55)
                    }
                    Text("Microsoft")
                }
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 50, height: 50)
                        
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                }.padding(.horizontal)
                Spacer()
            }.padding()
            
            // Email Navigation
            HStack {
                Text("Inbox").font(.system(size: 25)).foregroundColor(.blue).fontWeight(.regular)
                Text("Draft").font(.system(size: 25)).foregroundColor(.gray).padding(.horizontal)
                Text("Sent").font(.system(size: 25)).foregroundColor(.gray)
                Spacer()
                Text("Edit").font(.system(size: 20)).foregroundColor(.blue).fontWeight(.regular)
            }.padding(.horizontal)
            
            // Email List
            EmailListView()
                .padding(.horizontal).padding(.top).background(Color("TabBarBackground"))
}
        }
        .background(.white)
        .environmentObject(emailViewModel)
    }
}

struct MailsView_Previews: PreviewProvider {
    static var previews: some View {
        MailsView()
    }
}
