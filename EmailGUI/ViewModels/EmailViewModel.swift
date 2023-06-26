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
        emailModel.emails
    }

func filterMails(searchTerm: String) {
   var filteredEmails = emails.filter { $0.subject.contains(searchTerm) || $0.sender.name.contains(searchTerm) }
   emailModel.setEmails(filteredEmails)
}
    }
}
