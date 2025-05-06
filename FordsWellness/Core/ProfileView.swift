//
//  ProfileView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 5/1/25.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authService: AuthService
    
    @AppStorage("confirmationOverride") var confirmationOverride = false
    
    @State var tempRole : Role = .student
    @State var tempEmail : String = "hford@haverfordsd.net"
    @State var tempDate : String = "1/2/34"
    @State var tempCardView : Bool = true
    @State var confirmSignout : Bool = false
    @State var tempNewName : String = ""
    @State var tempNewClass : Class = .freshman
    @State var failedSave : Bool = false
    
    @State var editMode : Bool = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                if (tempRole == .student) {
                    Image(systemName: "graduationcap.circle")
                        .font(Font.custom("", size: 75))
                } else if (tempRole == .teacher) {
                    Image(systemName: "book.closed.circle")
                        .font(Font.custom("", size: 75))
                } else if (tempRole == .admin) {
                    Image(systemName: "gear.circle")
                        .font(Font.custom("", size: 75))
                }
                
                if (editMode) {
                    TextField("Henry Ford", text: $tempNewName)
                        .font(.largeTitle)
                        .frame(height: 50)
                        .textFieldStyle(.roundedBorder)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(failedSave ? .red : .gray)
                        )
                } else {
                    Text("Profile Last")
                        .font(.largeTitle)
                        .frame(height: 50)
                }
                
                Spacer()
            }
            .padding([.leading, .trailing, .top])
            
            HStack {
                if (tempRole == .student) {
                    if (editMode) {
                        Picker("", selection: $tempNewClass, content: {
                            Text("Freshman")
                                .tag(Class.freshman)
                            Text("Softmore")
                                .tag(Class.softmore)
                            Text("Junior")
                                .tag(Class.junior)
                            Text("Senoir")
                                .tag(Class.senior)
                        })
                        .accentColor(.primary)
                        .frame(height: 10)
                        .pickerStyle(.menu)

                    } else {
                        Text("\(tempNewClass.rawValue)")
                            .frame(height: 10)
                    }
                    Text(" / ")
                    Text("\(tempRole.rawValue)")
                } else {
                    Text("\(tempRole.rawValue)")
                }
                Spacer()
            }
            .padding([.leading, .trailing], 30)
            
            HStack {
                Text(tempEmail)
                Spacer()
            }
            .padding([.leading, .trailing], 30)
            
            Spacer()
            
            Text("Next Wellness: \(tempDate)")
            
            ActivityView(activity: ActivityModel(activityName: "Test", roomNumber: "492", teachers: [], capacity: 1, students: []), cardView: $tempCardView)
                .padding(.horizontal)
            
            Spacer()
            
            Button {
                editMode.toggle()
                print("EDIT")
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 2)
                    .frame(height: 50)
                    .overlay {
                        Text("Edit Profile")
                            .foregroundStyle(.black)
                    }
            }
            .padding([.leading, .trailing, .top])
            .opacity(editMode ? 0 : 1)
            
            Button {
                if (editMode) {
                    if (tempNewName == "") {
                        failedSave = true
                    } else {
                        failedSave = false
                        print("Save info")
                        editMode.toggle()
                    }
                    
                } else {
                    if (confirmationOverride) {
                        print("Sign Out")
//                        authService.signout()
                    } else {
                        confirmSignout = true
                    }
                }
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.black)
                    .frame(height: 50)
                    .overlay {
                        Text("\(editMode ? "Save" : "Sign Out")")
                            .foregroundStyle(.white)
                    }
            }
            .alert("Confirm Signout.", isPresented: $confirmSignout, actions: {
                Button("Sign Out") {
                    confirmSignout = false
                    
                    print("Sign Out")
                    authService.signout()
                }
                Button("Don't Show Again") {
                    confirmationOverride = true
                    confirmSignout = false
                    print("Sign Out")
                    //                        authService.signout()
                }
            })
            .padding([.leading, .trailing, .bottom])
            
            Text("Profile Created on 0/0/0000")
                .italic()
        }
    }
        
}

#Preview {
    ProfileView()
}
