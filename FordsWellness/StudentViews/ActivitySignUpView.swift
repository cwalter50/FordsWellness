//
//  ActivitySignUpView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 5/1/25.
//

import SwiftUI

struct ActivitySignUpView: View {
    @StateObject var vm: ContentViewModel = ContentViewModel()
    @EnvironmentObject var authService: AuthService
    
    @State var cardView: Bool = false
    @State var showSubmit: Bool = false
    @State var selectedActivity: ActivityModel? = nil
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    List {
                        ForEach(vm.activities) { activity in
                            Button {
                                selectedActivity = activity
                            } label: {
                                ActivityView(
                                    activity: activity,
                                    cardView: $cardView,
                                    isSelected: selectedActivity?.id == activity.id
                                )
                            }
                        }
                    }
                    .listStyle(.plain)
                    
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
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button{
                            //                            Add detail page or message here
                            //                            .presentationCompactAdaptation(.sheet)
                        } label: {
                            Text("Details")
                                .padding()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        if let selected = selectedActivity {
                            Button("Submit") {
                                showSubmit = true
                            }
                            .alert(isPresented: $showSubmit) {
                                Alert(
                                    title: Text("Are you sure you want to submit?"),
                                    message: Text("Your activity is \(selected.activityName) with \(selected.teachers.joined(separator: ", "))"),
                                    primaryButton: .default(Text("Submit")) {
                                        // Submit to Firebase and redirect here
                                        print("Submitting: \(selected.activityName)")
                                    },
                                    secondaryButton: .cancel()
                                    
                                )
                            }
                            .padding()
                        }
                    }
                }
                .padding()
            }
        }
    }
    
//    #Preview {
//        ActivitySignUpView()
//            .environmentObject(AuthService())
//    }
}
