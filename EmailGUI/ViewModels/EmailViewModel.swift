//
//  EmailViewModel.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import Foundation

class EmailViewModel: ObservableObject {
    
    @Published private var emailModel: EmailModel = EmailModel()
@Published var searchTerm: String = ""
    
var emails: [Email] {
    return emailModel.emails.filter { email in
      return email.subject.contains(self.searchTerm) || email.sender.contains(self.searchTerm) || email.content.contains(self.searchTerm)
    }
}

func filterMails(searchTerm: String) {
    self.searchTerm = searchTerm
    objectWillChange.send()
}


    func filterMails(searchTerm: String) {
        let lowercasedSearchTerm = searchTerm.lowercased()
        filteredEmails = emails.filter {
            $0.sender.name.lowercased().contains(lowercasedSearchTerm) ||
            $0.subject.lowercased().contains(lowercasedSearchTerm) ||
            $0.sender.email.lowercased().contains(lowercasedSearchTerm)
        }
    }

}