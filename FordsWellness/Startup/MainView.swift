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
                TabView {
                    TeacherView()
                        .tabItem {
                            Label("Teacher", systemImage: "house")
                        }
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                }
                
            }
            else if authService.currentUser != nil && authService.currentUserInfo?.role == .student {
                TabView {
                    StudentView()
                        .tabItem {
                            Label("Student", systemImage: "house")
                        }
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                }
            }
            else if authService.currentUser != nil && authService.currentUserInfo?.role == .admin
            {
                TabView {
                    AdminView()
                        .tabItem {
                            Label("Admin", systemImage: "house")
                        }
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                }
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
