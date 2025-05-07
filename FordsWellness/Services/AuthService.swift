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
@MainActor
class AuthService: ObservableObject {
    @Published var currentUser: FirebaseAuth.User?
    @Published var currentUserInfo: UserInfo?
//    static let shared = AuthService() // ensures singleton use of authservice in app.
    
    init() {
        self.currentUser = Auth.auth().currentUser
        

        
        _ = Auth.auth().addStateDidChangeListener { auth, user in
            
            if user != nil {
                self.currentUser = user
                if let id = user?.uid {
                    self.loadUserInfo(uid: id)
                }
                
                print("User is signed in with uid: \(user?.uid ?? "no id found")")
                
            } else {
                self.currentUser = nil
                self.currentUserInfo = nil
                print("User is signed out")
            }
        }
    }
    
    @MainActor
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
            self.currentUserInfo = try await loadUserInfo(uid: result.user.uid)
        } catch {
            print("DEBUG: error signing in: \(error)")
        }
        
    }
    
    func signout() {
        do {
            try Auth.auth().signOut()
            currentUser = nil
            currentUserInfo = nil
        } catch {
            print("DEBUG: Error signing out: \(error)")
        }
        
    }
    
    // this is used on init, when auth did change, which is not an async function.
    // ToDo. Figure out how to merge this with the async loadUserInfo, so the code is not repetitive.
    func loadUserInfo(uid: String)  {
        let db = Firestore.firestore()
        
        db.collection("UserInfo").document("\(uid)").getDocument { snapshot, error in
            if let err = error {
                print("DEBUG: error loading student info \(err)")
                return
            }
            if let data = snapshot?.data() {
                self.currentUserInfo = UserInfo(data: data)
            }
        }
    }
    
    // this is used when signing in when we are using async function
    func loadUserInfo(uid: String) async throws -> UserInfo? {
        do {
        let db = Firestore.firestore()
        
            let result = try await db.collection("UserInfo").document("\(uid)").getDocument()
            if let data = result.data() {
                return UserInfo(data: data)
                
            } else {
                print("No userInfo found for user with id: \(uid)")
            }
            
        } catch {
            print("DEBUG: Error loading user info: \(error)")
        }
        return nil
    }
    
}
