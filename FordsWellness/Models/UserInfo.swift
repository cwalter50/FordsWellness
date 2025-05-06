//
//  UserInfo.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/28/25.
//



import SwiftUI
import Foundation

enum Role: String {
    case admin = "Admin"
    case student = "Student"
    case teacher = "Teacher"
}

enum Class: String {
    case freshman = "Freshman"
    case softmore = "Softmore"
    case junior = "Junior"
    case senior = "Senior"
    
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
    
    init(data: [String: Any]) {
        self.name = data["name"] as? String ?? "No Name Found"
        let foundrole = data["role"] as? String ?? "Student"
        self.role = Role(rawValue: foundrole) ?? .student
        self.id = data["id"] as? String ?? UUID().uuidString
        self.year = data["year"] as? String ?? "9"
        self.homeroom = data["homeroom"] as? String ?? "0"
        self.email = data["email"] as? String ?? ""
        self.created = data["created"] as? Date ?? Date()
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
