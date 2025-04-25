//
//  FordsWellnessApp.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/3/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct FordsWellnessApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authService: AuthService = AuthService() // ensures singleton use of authservice in app.
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(authService)
        }
    }
}
