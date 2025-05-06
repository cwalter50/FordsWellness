//
//  AuthService.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/24/25.
//

import Foundation
import SwiftUI
import FirebaseAuth
import Firebase

class AuthService: ObservableObject {
    @Published var currentUser: FirebaseAuth.User?
    @Published var currentUserInfo: UserInfo?
//    static let shared = AuthService() // ensures singleton use of authservice in app.
    
    init() {
        self.currentUser = Auth.auth().currentUser
        
        _ = Auth.auth().addStateDidChangeListener { auth, user in
            
            if user != nil {
                self.currentUser = user
                print("User is signed in with uid: \(user?.uid ?? "no id found")")
            } else {
                self.currentUser = nil
                print("User is signed out")
            }
        }
    }
    
    func createUser(email: String, password: String, name: String, homeroom: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let db = Firestore.firestore()
            
            let StudentInfo = UserInfo(name: name, role: .student, year: "12", homeroom: homeroom, id: result.user.uid, created: Date(), email: email)
            let data = StudentInfo.toDictionaryValues()
            
            
                try await db.collection("UserInfo").document("\(StudentInfo.id)").setData(data)
              print("Document successfully written!")
            currentUserInfo = StudentInfo
            
        } catch {
            print("Error signing up \(error)")
        }

        
    }
    // test
    @MainActor
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: "\(email)", password: "\(password)")
            self.currentUser = result.user
            let db = Firestore.firestore()
            let userinfo = try await db.collection("UserInfo").document("\(result.user.uid)").getDocument()
            currentUserInfo = UserInfo(data: userinfo.data() ?? ["" : ""])
        } catch {
            print("DEBUG: error signing in: \(error)")
        }
        
    }
    
    func signout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out: \(error)")
        }
        
    }
    
}
