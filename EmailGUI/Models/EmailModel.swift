//
//  MailsModel.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import Foundation

// This model represents the "api" in which we're going to receive the list of emails
struct EmailModel {

    private(set) var emails: [Email]
    
    init() {
        
        // set the list of emails to the mock list of emails
        var people = [Person]()
        emails = [Email]()
        
        for i in 0..<10 {
            let person = Person(name: names[i], email: "\(names[i].split(separator: " ")[0].lowercased()).\(names[i].split(separator: " ")[1].lowercased())@example.com", profilePicture: profilePictures[i])
            people.append(person)
            let email = Email(sender: person, subject: subjects[i], message: message, date: Date(), category: .sent, isFavorite: true)
            emails.append(email)
        }
    }
    
    // Api call to get the list of emails from the backend server I built in Express.js (only works locally)
    func getApiEmailList() {
        guard let url = URL(string: "http:localhost:3000/emails") else { return }

            URLSession.shared.dataTask(with: url) {(data, response, error) in
               guard let _ = email.message else { return }
            }.resume()
    }
    
   mutating func setEmails(_ emails: [Email]) {
       self.emails = emails
   }
}

