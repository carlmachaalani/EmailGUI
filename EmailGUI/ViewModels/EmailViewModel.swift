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

    @Published var filteredEmails: [Email] = []
    

func filterMails(searchTerm: String) {
        var lowercasedSearchTerm = searchTerm.lowercased()
        self.filteredEmails = emailModel.mails.filter {
            $0.sender.name.lowercased().contains(lowercasedSearchTerm) ||
            $0.subject.lowercased().contains(lowercasedSearchTerm) ||
            $0.sender.email.lowercased().contains(lowercasedSearchTerm)
        }
    }

}