//
//  MockData.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import Foundation

// This file creates the mock data for the list of emails
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
    var isFavorite: Bool = true
}

let names = ["John Doe", "Jane Doe", "Bob Smith", "Alice Johnson", "Eve Adams", "Tom Davis", "Emma Wilson", "Michael Brown", "Sarah Davis", "David Anderson"]
let subjects = ["Important meeting", "Project update", "Reminder: deadline approaching", "Invitation to event", "Weekly report", "New opportunity", "Action required", "Urgent: response needed", "Follow-up", "Good news"]
let message = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
let profilePictures = ["person1", "person2", "person3", "person4", "person5", "person6", "person7", "person8", "person9", "person10"]

