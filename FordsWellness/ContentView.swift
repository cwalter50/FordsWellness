//
//  ContentView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/3/25.
//
// test

import SwiftUI

struct ContentView: View {
    @StateObject var vm : ContentViewModel = ContentViewModel()
    
    
    @State var cardView : Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    AuthService.shared.createUser()
                } label: {
                    Text("Sign up")
                }
                Button {
                    Task {
                        try await AuthService.shared.signIn()
                    }
                    
                } label: {
                    Text("Sign in")
                }
                Button {
                    AuthService.shared.signout()
                } label: {
                    Text("Sign out")
                }
                


//                ScrollView(.vertical) {
                List {

                    ForEach(vm.activities) {
                        activity in
                        ActivityView(activity: activity, cardView: $cardView)
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
