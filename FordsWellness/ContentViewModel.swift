//
//  ContentViewModel.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/9/25.
//

import Foundation
import SwiftUI
import Firebase


class ContentViewModel: ObservableObject {
    
    @Published var activities: [Activity] = []
    
    init() {

        
    }
    
    func loadDataFromFirebase() async throws{
        
        let db = Firestore.firestore()
        
        do {
          let querySnapshot = try await db.collection("Activity").getDocuments()
          for document in querySnapshot.documents {
//            print("\(document.documentID) => \(document.data())")
              
              let foundActivity = Activity(data: document.data())
              activities.append(foundActivity)
              print("Added activity: \(foundActivity.activityName)")
          }
        } catch {
          print("Error getting documents: \(error)")
        }

    }
    
}
