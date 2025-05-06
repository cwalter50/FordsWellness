//
//  ActivityDetailView.swift
//  FordsWellness
//
//  Created by Owen F on 5/2/25.
//

import SwiftUI

struct DetailView: View{
    @StateObject var vm: ContentViewModel = ContentViewModel()

    @State var activity: ActivityModel = ActivityModel(activityName: "", capacity: 0)
    @State var message: String = "hi"

    var body: some View{
        
        ForEach(vm.activities){ val in
            Text(activity.activityName)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 3)
                        .shadow(color: .gray, radius: 5)
                )
            }
        
    }
}
struct testView: View{
    
    var body: some View{
        DetailView()
    }
}

#Preview{
    testView()
}
