//
//  TeacherView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 5/1/25.
//

import SwiftUI

struct TeacherView: View {
    @State private var teacherName = "Gideon Dayo"
    @State private var activities = ["Eat uranium activity", "Learn to fly with Andre", "Gideon's pizza pie eating"]
    
    var body: some View {
        NavigationView {
            VStack {
            
                ZStack {
                    Rectangle()
                        .frame(width: 250, height: 150)
                        .cornerRadius(25)
                        .foregroundColor(Color.blue)
                        .shadow(radius: 10)
                    Text("Welcome " + teacherName)
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                }
            
                Button(action: {
                    
                    print("Create new activity tapped")
                }) {
                    Text("Create New Activity")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(25)
                        .frame(width: 300, height: 60)
                        .shadow(radius: 5)
                }
                .padding(.top, 20)
                
                Spacer()

                // ScrollView to list activities
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(activities, id: \.self) { activity in
                            Button(action: {
                                print("\(activity) tapped")
                            }) {
                                HStack {
                                    Text(activity)
                                        .font(.body)
                                        .foregroundColor(.blue)
                                        .padding()
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.blue)
                                        .padding(.trailing, 10)
                                }
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                                .padding(.horizontal)
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .padding(.bottom, 20)
                }

                Spacer()
            }
            .navigationTitle("Teacher View")
            .background(Color(UIColor.systemGray6))
        }
    }
}

#Preview {
    TeacherView()
}
