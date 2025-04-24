//
//  ActivityView.swift
//  FordsWellness
//
//  Created by Benjamin Scotti on 4/8/25.
//

import SwiftUI

struct ActivityView: View {
    
    @State var activity : ActivityModel = ActivityModel(activityName: "No Name", capacity: 3)
    @Binding var cardView : Bool
    
    var body: some View {
        
        if cardView {
            ZStack {
                
                Image(systemName: "desktopcomputer")
                    .resizable()
                    .padding(10)
                    .foregroundStyle(.orange)
                    .brightness(-0.5)
                
                HStack {
                    VStack {
                        Text("\(activity.activityName)")
                            .font(.title)
                            .bold()
                            .padding([.top, .leading, .trailing])
                            .foregroundStyle(.white)
                            .shadow(color: .black, radius: 3)
                        
                        Text("\(activity.roomNumber)")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .shadow(color: .black, radius: 3)
                        Spacer()
                        Text("\(getTeachers())")
                            .italic()
                            .frame(maxWidth: .infinity, maxHeight: 200, alignment: .leading)
                            .background(Color.white.opacity(0.75))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                ZStack {
                    Capsule()
                        .foregroundStyle(.gray)
                        .brightness(-0.25)
                        .frame(width: 250, height: 10)
                        .rotationEffect(Angle(degrees: -90), anchor: .trailing)
                        .offset(y: -125)
                        .shadow(color: .black, radius: 3)
                    Capsule()
                        .foregroundStyle(activity.students.count < activity.capacity ? .green : .red)
                        .brightness(activity.students.count < activity.capacity ? 0 : 0.1)
                        .frame(width: CGFloat(250 * (Double(activity.students.count) / Double(activity.capacity))), height: 10)
                        .rotationEffect(Angle(degrees: -90), anchor: .trailing)
                        .offset(x: (250-CGFloat(250 * (Double(activity.students.count) / Double(activity.capacity)))) / 2, y: 125 - CGFloat(250 * (Double(activity.students.count) / Double(activity.capacity))))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 20)
            }
            .frame(height: 300)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.orange)
                    .shadow(color: .gray, radius: 5)
//                    .frame(maxWidth: .infinity, maxHeight: 200)
            )
            .padding(5)
            
            
        } else {
            
            
            HStack {
                Image(systemName: "desktopcomputer")
                    .foregroundStyle(.orange)
                    .font(.largeTitle)
                VStack {
                    HStack {
                        Text("\(activity.activityName)")
                            .bold()
                        Text("- \(activity.roomNumber)")
                            .font(.footnote)
                            .padding(.leading, -5)
                        Spacer()
                        Text("\(activity.students.count)/\(activity.capacity)")
                            .foregroundStyle((activity.students.count < activity.capacity) ? Color.primary : Color.red)
                            .brightness((activity.students.count < activity.capacity) ? 0 : -0.2)
                    }
                    .padding(.horizontal, 10)
                    
                    Text("\(getTeachers())")
                        .italic()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                }
            }
            .frame(height: 100)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .shadow(color: .gray, radius: 5)
            )
            .padding(5)
        }
    }
    
    func getTeachers() -> String {
        var returnStr : String = ""
        for teacher in activity.teachers {
            returnStr += "\(teacher), "
        }
        
        return String(returnStr[..<returnStr.lastIndex(of: ",")!])
    }
}

//#Preview {
//    ActivityView()
//}
