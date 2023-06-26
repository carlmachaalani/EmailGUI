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
    
private func handleSearchTermChanged() {
			emailViewModel.filterMails(searchTerm: searchTerm)
		}
     }
     // search bar input term
     @State var searchTerm: String = "Email, Name, etc..."
    
    var body: some View {
        
        VStack {
            
            // Welcome message
            HStack {
                VStack(alignment: .leading) {
                    Text("Hey, Henri").fontWeight(.semibold)
                    Text("You have a few messages").font(.largeTitle).fontWeight(.bold).padding(.trailing, 10.0)
                }.padding(.horizontal)
                Spacer()
                Image("person1")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .padding(.trailing)
            }
            
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 8)
                    .foregroundColor(.gray)
                
TextField("Email, Name, etc...", text: $searchTerm, onCommit: handleSearchTermChanged).onTapGesture { searchTerm = "" }
                    .foregroundColor(.gray)

                Image(systemName: "mic.fill")
                    .padding(.trailing, 8)
                    .foregroundColor(.gray)
            }
            .padding()
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
        .padding(.top, 70.0)
        .background(.white)
        .environmentObject(emailViewModel)
    }
}

struct MailsView_Previews: PreviewProvider {
    static var previews: some View {
        MailsView()
    }
}
