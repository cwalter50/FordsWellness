//
//  Activity.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/3/25.
//

import Foundation
import Firebase

struct ActivityModel: Identifiable {
    var activityName: String
    var roomNumber: String
    var teachers: [String]
    var capacity: Int
    var students: [String]
    var id: String = UUID().uuidString
    var created: Date = Date()
    
    var teacherIDs: [String] = [String]() // this will be used to load all names of the teachers from UserInfo
    
    
    init(activityName: String, roomNumber: String = "Auditorium", teachers: [String] = [String](), capacity: Int, students: [String] = [String]()) {
        self.activityName = activityName
        self.roomNumber = roomNumber
        self.teachers = teachers
        self.capacity = capacity
        self.students = students
    }
    
    init(data: [String: Any]) {
        self.activityName = data["activityName"] as? String ?? "No Name Found"
        self.capacity = data["capacity"] as? Int ?? 30
        self.id = data["id"] as? String ?? UUID().uuidString
        self.roomNumber = data["roomNumber"] as? String ?? "Auditorium"
        self.students = data["students"] as? [String] ?? ["No Students"]
        self.teachers = data["teachers"] as? [String] ?? ["No Teacher Found"]
        self.created = data["created"] as? Date ?? Date()
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
    
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    
    
    
    
    
    
}

