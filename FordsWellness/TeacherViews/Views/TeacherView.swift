//
//  TeacherView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 5/1/25.
//

import SwiftUI

struct TeacherView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is what the teacher should see when they sign in. It might have a subView or navigation link to ContentView on it which is a list of all the activities. It should also have a navigation link to createActivityView. It should also have a list of all of the activites that the teacher is a part of.")
            }
        }
        
    }
}

#Preview {
    TeacherView()
}
