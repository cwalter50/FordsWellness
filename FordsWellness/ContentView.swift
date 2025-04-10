//
//  ContentView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/3/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm : ContentViewModel = ContentViewModel()
    
    @State var cardView : Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
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
