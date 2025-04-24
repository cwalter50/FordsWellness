//
//  AuthService.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/24/25.
//

import Foundation
import SwiftUI
import FirebaseAuth

class AuthService: ObservableObject {
    @Published var currentUser: FirebaseAuth.User?
    
    static let shared = AuthService() // ensures singleton use of authservice in app.
    
    init() {
        self.currentUser = Auth.auth().currentUser
        
        let listener = Auth.auth().addStateDidChangeListener { auth, user in
            
            if user != nil {
                self.currentUser = user
                print("User is signed in with uid: \(user?.uid ?? "no id found")")
            } else {
                self.currentUser = nil
                print("User is signed out")
            }
        }
    }
    
    func createUser() {
        Auth.auth().createUser(withEmail: "test2@email.com", password: "123456") {
            result, error in
            if let err = error {
                print(err)
            } else {
                print("User created in: \(result?.user.uid ?? "No Id Created")" )
            }
        }
        
    }
    // test
    
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: "\(email)", password: "\(password)")
            self.currentUser = result.user
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
