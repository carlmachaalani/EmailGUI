//
//  ViewRouter.swift
//  EmailGUI
//
//  Created by Carl Machaalany on 2023-02-12.
//

import SwiftUI

// This view router keeps track of the page the user is at.
class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .mails
    
}


enum Page {
    case mails
    case setting
}
