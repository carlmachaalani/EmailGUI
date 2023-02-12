//
//  MockData.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import Foundation

struct Person {
    let name: String
    let email: String
    let profilePicture: String
}

enum EmailCategory {
    case draft
    case sent
}

struct Email: Identifiable {
    let id = UUID()
    let sender: Person
    let subject: String
    let message: String
    let date: Date
    let category: EmailCategory
    var isFavorite: Bool = false
}

let names = ["John Doe", "Jane Doe", "Bob Smith", "Alice Johnson", "Eve Adams", "Tom Davis", "Emma Wilson", "Michael Brown", "Sarah Davis", "David Anderson"]
let subjects = ["Important meeting", "Project update", "Reminder: deadline approaching", "Invitation to event", "Weekly report", "New opportunity", "Action required", "Urgent: response needed", "Follow-up", "Good news"]
let messages = ["Please find attached the agenda for the meeting", "As per our discussion, attached is the latest project update", "Don't forget about the deadline, it's coming up fast!", "You're cordially invited to our annual event", "Here's a summary of this week's activity", "We'd like to offer you a new position", "We need your input on this matter", "Can you please respond as soon as possible?", "Just wanted to follow up on our previous conversation", "We're pleased to announce a new partnership"]
let profilePictures = ["person1", "person2", "person3", "person4", "person5", "person6", "person7", "person8", "person9", "person10"]


func getMockEmails() -> [Email] {
    
    var people = [Person]()
    var emails = [Email]()
    
    for i in 0..<10 {
        let person = Person(name: names[i], email: "\(names[i].split(separator: " ")[0].lowercased()).\(names[i].split(separator: " ")[1].lowercased())@example.com", profilePicture: profilePictures[i])
        people.append(person)
        let email = Email(sender: person, subject: subjects[i], message: messages[i], date: Date(), category: .sent, isFavorite: true)
        emails.append(email)
    }
    return emails
}

