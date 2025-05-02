//
//  AdminView.swift
//  FordsWellness
//
//  Created by Christopher Walter on 5/1/25.
//

import SwiftUI

struct AdminView: View {
    var body: some View {
        @State var searchedActivity: String = ""
        NavigationStack {
            VStack {
//                Admin View should contain the info that an Admin sees when they sign in. Admin view should probably have the ability to create activites, edit activites, and delete activities. They should see all the activites as well (Probably use ContentView as a subview.) . Search for activites
                
                RoundedRectangle(cornerRadius: 9.0)
                    .frame(width: 350, height: 45)
                    .foregroundStyle(.white)
                    .overlay{
                        HStack{
                            TextField(text: $searchedActivity) {
                                Text("Search for an activity")
                                    .bold()
                                    .foregroundStyle(Color(red: 130/255, green: 130/255, blue: 130/255))
                                //color of placeholder text
                            }//end textfield
                            .bold()
                            .foregroundStyle(Color(red: 130/255, green: 130/255, blue: 130/255))
                            //color of typed text
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .bold()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color(red: 160/255, green: 160/255, blue: 160/255))
                        }//end hstack in overlay
                        .padding(.horizontal)
                    }//end overlay
                
                Text("All activities")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 30)
                    .bold()
                    .foregroundStyle(Color(red: 130/255, green: 130/255, blue: 130/255))
                
                List{
                    RoundedRectangle(cornerRadius: 9.0)
                        .frame(height: 40)
                        .foregroundStyle(.white)
                        .overlay{
                            HStack{
                                Text("🧑🏽‍💻")
                                    .font(.system(size: 40))
                                VStack{
                                    HStack{
                                        Text("Coding Contest")
                                            .bold()
                                            .foregroundStyle(Color(red: 130/255, green: 130/255, blue: 130/255))
                                        Text("with Mr. Walter")
                                            .bold()
                                            .foregroundStyle(Color(red: 170/255, green: 170/255, blue: 170/255))
                                    }//end hstack
                                    Text("Room 329")
                                        .bold()
                                        .foregroundStyle(Color(red: 150/255, green: 150/255, blue: 150/255))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 9)
                                }//end vstack
                            }
                        }//end overlay
                }//end list
//                .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                .scrollContentBackground(.hidden)
                
            }//end entire vstack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 230/255, green: 230/255, blue: 230/255))
        }//end navigation stack
        
    }
}

#Preview {
    AdminView()
}
