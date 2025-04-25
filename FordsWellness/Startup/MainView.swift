//
//  MainView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/24/25.
//

import SwiftUI

struct MainView: View {
    
    
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
        Group {
            if authService.currentUser != nil {
                ContentView()
            } else {
                SignInView()
            }
        }
        
    }
}

#Preview {
    MainView()
}
