//
//  CreateActivityViewModel.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/8/25.
//

import Foundation
import SwiftUI
import Firebase

class CreateActivityViewModel: ObservableObject {
    @Published var activityNameInput: String = ""
    @Published var teacherNameInput: String = ""
    @Published var studentCapacityInput: Int?
    @Published var roomNumberInput: String = ""
    
    
    
    func writeToFirebase() async throws {
        
        let db = Firestore.firestore()
        
        let newActivity = Activity(activityName: activityNameInput, roomNumber: roomNumberInput ?? "Auditorium", teachers: [teacherNameInput], capacity: studentCapacityInput ?? 30)
        let data = newActivity.toDictionaryValues()
//        let docData: [String: Any] = [
//          "stringExample": "Hello world!",
//          "booleanExample": true,
//          "numberExample": 3.14159265,
//          "dateExample": Timestamp(date: Date()),
//          "arrayExample": [5, true, "hello"],
//          "nullExample": NSNull(),
//          "objectExample": [
//            "a": 5,
//            "b": [
//              "nested": "foo"
//            ]
//          ]
//        ]
        do {
            try await db.collection("Activity").document("\(newActivity.id)").setData(data)
          print("Document successfully written!")
        } catch {
          print("Error writing document: \(error)")
        }
    }
    
}
