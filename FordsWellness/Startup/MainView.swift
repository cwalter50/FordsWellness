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
            if authService.currentUser != nil && authService.currentUserInfo?.role == .teacher {
                TeacherView()
            }
            else if authService.currentUser != nil && authService.currentUserInfo?.role == .student {
                StudentView()
            }
            else if authService.currentUser != nil && authService.currentUserInfo?.role == .admin
            {
                AdminView()
            }
            
            else {
                SignInView()
            }
        }
        
    }
}

#Preview {
    MainView()
}
