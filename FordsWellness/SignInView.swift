//
//  SignInView.swift
//  FordsWellness
//
//  Created by Gideon Dayo on 4/23/25.
//

import SwiftUI

struct SignInView: View {
// test
   // @EnvironmentObject var vm:MyDataViewModel
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false


    var body: some View {
        
        NavigationView{
            ZStack{
                Color.blue.ignoresSafeArea()
                Circle()
                    .scale (1.7)
                    .foregroundColor(.white.opacity(0.15))
                
                Circle()
                    .scale (1.2)
                    .foregroundColor(.white.opacity(0.15))
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(width:325,height:250)
                    .foregroundColor(.white.opacity(0.9))
                    .hoverEffect()
                
                
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    //  Button("Login"){}
                    //  .foregroundStyle(.white)
                    //  .frame(width:100, height:40)
                    //  background(Color.blue.opacity(0.7))
                    //  .cornerRadius(10)
                    
                    NavigationLink("Sign Up") {
                        
                        //                        SignUpView()
                        
                    }
                    Button("Login"){
                        
                    }
                    .foregroundStyle(.white)
                    .frame(width:100, height:40)
                    .background(Color.blue.opacity(0.7))
                    .cornerRadius(10)
                    
                }
            }
        }
        
    }

//        .navigationBarHidden(true)
    }

    

//    func authenticateUser(username: String, password: String) {

//            if username.lowercased() == "Username" {

//                wrongUsername = 0

//                if password.lowercased() == "Password" {

//                    wrongPassword = 0

//                    showingLoginScreen = true

//                } else {

//                    wrongPassword = 2

//                }

//            } else {

//                wrongUsername = 2

//            }

//        }

//    }

//









#Preview {

    SignInView()

       // .environmentObject(MyDataViewModel())

}
