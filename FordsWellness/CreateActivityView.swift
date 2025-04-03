//
//  CreateActivityView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/3/25.
//

import SwiftUI

struct CreateActivityView: View {
    var body: some View {
        VStack{
            Text("Activities")
                .bold()
                .font(.system(size: 40))
            
            
            
            Text("Activity Name")
                .bold()
                .foregroundStyle(.gray)
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(.gray)
                .frame(width: 300, height: 30)
            
            
            
            
        }
    }
}

#Preview {
    CreateActivityView()
}
