//
//  Task.swift
//  ToDoApp
//
//  Created by Admin on 22/04/2019.
//  Copyright © 2019 Admins. All rights reserved.
//

import Foundation

struct Task {
    var title: String
    var description: String?
   private(set) var date: Date?
    
    
    init(title: String, description: String? = nil) {
        self.title = title
        self.description = description
        self.date = Date()
    }
}
