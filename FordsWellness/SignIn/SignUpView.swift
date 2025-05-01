//
//  SignUpView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 5/1/25.
//

import SwiftUI

struct SignUpView: View {
    
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmpass = ""
    @State private var name = ""
    @State private var homeroom = ""
    @State private var badpass = 0
    
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .bold()
                .padding()
            
            TextField("Email", text: $email)
            
                .padding()
                .frame(width: 300, height:50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .onSubmit {
                
                    if !email.contains("@"){
                        email += "@haverfordsd.net"
                    }
                    email = email.lowercased()
                    
            
                }
            
            SecureField("Password", text: $password)
                .padding()
                .frame(width: 300, height:50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: CGFloat(badpass))
            
            SecureField("Confirm Password", text: $confirmpass)
                .padding()
                .frame(width: 300, height:50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: CGFloat(badpass))
                .onSubmit {
                    if !(confirmpass == password){
                        badpass = 3
                    }
                    else{
                        badpass = 0
                    }
                }

            TextField("Homeroom", text: $homeroom)
                .padding()
                .frame(width: 300, height:50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .onSubmit {
                    if homeroom.contains(/\d+/){
                        
                    }
                    else{
                        homeroom = "Homeroom number only"
                    }
                }
            
          
            
                    }
        
    }
}

#Preview {
    SignUpView()
}
