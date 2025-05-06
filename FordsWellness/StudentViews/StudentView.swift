//
//  StudentView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 5/1/25.
//

import SwiftUI

struct StudentActivity: Identifiable {
    var id = UUID()
    var title: String
    var date: String
}

struct StudentView: View {
    @State var username: String = "Filler name"
    @State var activities: [StudentActivity] = [
        StudentActivity(title: "Skateboarding", date: "May 1"),
        StudentActivity(title: "Adrian Worship", date: "May 2"),
        StudentActivity(title: "Mobile Apps", date: "May 3"),
        StudentActivity(title: "Swag class", date: "May 4"),
        StudentActivity(title: "fords wellness", date: "May 5"),
        StudentActivity(title: "Filler", date: "May 6"),
        StudentActivity(title: "filler", date: "May 7"),
        StudentActivity(title: "filler", date: "May 8"),
        StudentActivity(title: "filler", date: "May 9"),
        StudentActivity(title: "filler", date: "May 10"),
        StudentActivity(title: "filler", date: "May 11"),
        StudentActivity(title: "filler", date: "May 12"),
        StudentActivity(title: "filler", date: "May 13"),
        StudentActivity(title: "filler", date: "May 14"),
        StudentActivity(title: "filler", date: "May 15"),
        StudentActivity(title: "filler", date: "May 9")
    ]
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Your Activities:")
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)
                            .offset(x: -18)

                        ForEach(activities) { activity in
                            VStack(alignment: .leading, spacing: 1) {
                                Text(activity.title)
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                Text(activity.date)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.50), radius: 3, x: 0, y: 2)
                        }
                    }
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(UIColor.systemGroupedBackground))
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Welcome, \(username)!")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ActivitySignUpView()) {
                        Image(systemName: "plus.app.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.blue)
                            .padding(.top, 4)
                            .shadow(color: .blue.opacity(0.75), radius: 8, x: 0, y: 2)
                    }
                }
            }
        }
    }
}

#Preview {
    StudentView()
}


//        This is the view students see when they sign in. This view should display info about the signed in user. It should allow them to see activities that they signed up. It should also have a navigationLink to direct them to a signup for an activity View
