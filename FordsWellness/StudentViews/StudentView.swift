//
//  StudentView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 5/1/25.
//

import SwiftUI

struct StudentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is the view students see when they sign in. This view should display info about the signed in user. It should allow them to see activities that they signed up. It should also have a navigationLink to direct them to a signup for an activity View")
            }
        }
        
    }
}

#Preview {
    StudentView()
}
