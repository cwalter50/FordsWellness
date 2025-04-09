//
//  ContentView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var cardView : Bool = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                ScrollView(.vertical) {
                    ActivityView(activity: Activity(activityName: "ACSL", roomNumber: "101", teachers: ["Chris Walter, Jennifer Mcnulty Brown"], capacity: 30, students: ["", "", "", ""]), cardView: $cardView)
                    ActivityView(activity: Activity(activityName: "ACSL", roomNumber: "101", teachers: ["Chris Walter, Jennifer Mcnulty Brown"], capacity: 5, students: [""]), cardView: $cardView)
                    ActivityView(activity: Activity(activityName: "ACSL", roomNumber: "101", teachers: ["Chris Walter, Jennifer Mcnulty Brown"], capacity: 5, students: ["","",""]), cardView: $cardView)
                    ActivityView(activity: Activity(activityName: "ACSL", roomNumber: "101", teachers: ["Chris Walter, Jennifer Mcnulty Brown"], capacity: 2, students: ["", ""]), cardView: $cardView)
                    ActivityView(activity: Activity(activityName: "ACSL", roomNumber: "101", teachers: ["Chris Walter, Jennifer Mcnulty Brown"], capacity: 2, students: [""]), cardView: $cardView)
                    ActivityView(activity: Activity(activityName: "ACSL", roomNumber: "101", teachers: ["Chris Walter, Jennifer Mcnulty Brown"], capacity: 30, students: []), cardView: $cardView)
                    ActivityView(activity: Activity(activityName: "ACSL", roomNumber: "101", teachers: ["Chris Walter, Jennifer Mcnulty Brown"], capacity: 30, students: []), cardView: $cardView)
                }

                Button {
                    cardView.toggle()
                } label: {
                    Image(systemName: "\(cardView ? "lightswitch.on" : "lightswitch.off")")
                        .font(.largeTitle)
                        .foregroundStyle(Color.black)
                }
                .rotationEffect(Angle(degrees: 90))

            }
            .navigationTitle("Fords Wellness")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        CreateActivityView()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            })
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
