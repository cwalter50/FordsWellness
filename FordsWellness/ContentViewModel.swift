//
//  ContentViewModel.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/9/25.
//

import Foundation
import SwiftUI
import Firebase

@MainActor
class ContentViewModel: ObservableObject {
    
    @Published var activities: [ActivityModel] = []
    @Published var ints : [Int] = []
    @Published var inty : Int = 0
    
    init() {
        
        Task {
            try await loadDataFromFirebase()
        }
        
    }
    
    func loadDataFromFirebase() async throws{
        
        let db = Firestore.firestore()
        
        do {
          let querySnapshot = try await db.collection("Activity").getDocuments()
          for document in querySnapshot.documents {
            print("\(document.documentID) => \(document.data())")
              
              let foundActivity = ActivityModel(data: document.data())
              activities.append(foundActivity)
              print("Added activity: \(foundActivity.activityName)")
          }
        } catch {
          print("Error getting documents: \(error)")
        }

    }
    
}
