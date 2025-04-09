//
//  Activity.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/3/25.
//

import Foundation
import Firebase


class Activity: Identifiable {
    var activityName: String
    var roomNumber: String
    var teachers: [String]
    var capacity: Int
    var students: [String]
    var id: String = UUID().uuidString
    var created: Date = Date()
    
    
    init(activityName: String, roomNumber: String = "Auditorium", teachers: [String] = [String](), capacity: Int, students: [String] = [String]()) {
        self.activityName = activityName
        self.roomNumber = roomNumber
        self.teachers = teachers
        self.capacity = capacity
        self.students = students
    }
    
    func toDictionaryValues() -> [String: Any] {
        return [
            "activityName": activityName,
            "roomNumber": roomNumber,
            "teachers": teachers,
            "capacity": capacity,
            "students": students,
            "id": id,
            "created": created
        ]
    }
    
    
    
    
    
}

