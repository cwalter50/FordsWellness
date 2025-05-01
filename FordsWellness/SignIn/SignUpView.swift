//
//  SignUpView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 5/1/25.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack {
            Text("This is signup view. It should have a form for the user to fill out with info about themselves. It should email, password, confirm password, name, homeroom, role (teacher, admin, or student). homeroom should be optional, because teachers and admin do not have homerooms.")
            Text("This view should also have a button to click that will signup for a new account. After signup, they will be logged in")
        }
        
    }
}

#Preview {
    SignUpView()
}
