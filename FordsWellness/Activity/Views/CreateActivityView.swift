//
//  CreateActivityView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 4/3/25.
//

import SwiftUI

struct CreateActivityView: View {

    @Environment(\.dismiss) var dismiss
    @StateObject var vm: CreateActivityViewModel = CreateActivityViewModel()
    
    var body: some View {
        VStack(spacing: 13){
            
            Text("Create an Activity")
                .bold()
                .font(.system(size: 40))
                .padding(.bottom, 40)
                .padding(.top, 25)
                        
            VStack{
                Text("Activity Name")
                    .bold()
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15))
                
                RoundedRectangle(cornerRadius: 9.0)
                    .stroke(.gray)
                    .frame(width: 330, height: 30)
                    .overlay{
                        TextField("activity_input", text: $vm.activityNameInput, prompt: Text("Baking")
                            .foregroundColor(.gray)
                            .bold()
                        )
                        .foregroundColor(.black)
                        .bold()
                        .padding(.leading)
                    }//end overlay
                    .frame(maxWidth: .infinity, alignment: .leading)
            }//end vstack
            .padding(.leading, 30)
            
            HStack(spacing: 30){
                VStack{
                    Text("Capacity")
                        .bold()
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                    
                    RoundedRectangle(cornerRadius: 9.0)
                        .stroke(.gray)
                        .frame(width: 40, height: 30)
                        .overlay{
                            TextField("capacity_input", value: $vm.studentCapacityInput, format: .number, prompt: Text("1")
                                .foregroundColor(.gray)
                                .bold())
                            .foregroundColor(.black)
                            .bold()
                            .multilineTextAlignment(.center)
                        }//end overlay
                        .padding(.leading, 13)
                }//end capacity vstack
                
                
                VStack{
                    Text("Room #")
                        .bold()
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                    
                    RoundedRectangle(cornerRadius: 9.0)
                        .stroke(.gray)
                        .frame(width: 40, height: 30)
                        .overlay{
                            TextField("room_input", text: $vm.roomNumberInput, prompt: Text("1")
                                .foregroundColor(.gray)
                                .bold())
                            .foregroundColor(.black)
                            .bold()
                            .multilineTextAlignment(.center)
                        }//end overlay
                        .padding(.leading, 13)
                }//end room number vstack
                
                VStack{
                    Text("Teacher")
                        .bold()
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                    
                    RoundedRectangle(cornerRadius: 9.0)
                        .stroke(.gray)
                        .frame(width: 140, height: 30)
                        .overlay{
                            TextField("teacher_input", text: $vm.teacherNameInput, prompt: Text("Mr. Walter")
                                .foregroundColor(.gray)
                                .bold()
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .bold()
                        }//end overlay
                        .padding(.leading, 13)
                }//end room number vstack
                
            }//end hstack with capacity and room number and teacher name
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            
            HStack(spacing: 10){
                Button{
                    dismiss()
                } label: {
                    RoundedRectangle(cornerRadius: 9.0)
                        .frame(width: 80, height: 30)
                        .foregroundColor(.red)
                        .shadow(color: .red.opacity(0.7), radius: 10.0)
                        .overlay{
                            Text("Cancel")
                                .foregroundColor(.white)
                                .bold()
                        }//end overlay
                }//end cancel button
                
                Button{
                    Task {
                        try await vm.writeToFirebase()
                        dismiss()
                    }
                    
                } label: {
                    RoundedRectangle(cornerRadius: 9.0)
                        .frame(width: 80, height: 30)
                        .foregroundColor(.blue)
                        .shadow(color: .blue.opacity(0.7), radius: 10.0)
                        .overlay{
                            Text("Save")
                                .foregroundColor(.white)
                                .bold()
                        }//end overlay
                }//end save button
                .disabled(vm.activityNameInput == "" || vm.teacherNameInput == "")
            }//end hstack with buttons
            .padding(.vertical)
           
            Spacer()
            
        }//end entire vstack
    }
}

#Preview {
    CreateActivityView()
}
