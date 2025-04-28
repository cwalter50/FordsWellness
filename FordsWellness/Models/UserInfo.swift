//
//  UserInfo.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/28/25.
//



import SwiftUI
import Foundation

enum Role: String {
    case admin
    case student
}

struct UserInfo: Identifiable {
    var name: String
    var role: Role
    var year: String
    var homeroom: String
    var id: String
    var created: Date
    var email: String
    
    init(name: String, role: Role, year: String, homeroom: String, id: String, created: Date, email: String) {
        self.name = name
        self.role = role
        self.year = year
        self.homeroom = homeroom
        self.id = id
        self.created = created
        self.email = email
    }
    
    func toDictionaryValues() -> [String: Any] {
        return [
            "name": name,
            "id": id,
            "role": role.rawValue,
            "year": year,
            "homeroom": homeroom,
            "created": created,
            "email": email
        ]
    }
    
}
