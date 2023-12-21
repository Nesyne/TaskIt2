//
//  SettingView.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/8/23.
//

import Foundation
import SwiftUI
struct SettingView: View {
    @AppStorage("ColorD") var ColorD: Color = .green
    @AppStorage("ColorW") var ColorW: Color = .red
    @AppStorage("ColorM") var ColorM: Color = .orange
    @AppStorage("ColorY") var ColorY: Color = .blue
    
    @State var dateS = Date()
    @State var dateD = Date()
    @State var dateDW = Date()
    @State var day = 0
    var body: some View {
        Form {
// Take away save buttons
//make subs sections for each type of reminder and set days/time if needed
// make the start higher
            Section(header: Text("Day start and end times")){
                DatePicker("Starts", selection: $dateS, displayedComponents: .hourAndMinute)
                    .onAppear(){
                        if (UserDefaults.standard.object(forKey: "SDay") != nil){
                            dateS = UserDefaults.standard.object(forKey: "SDay") as! Date
                        }
                        else{
                            UserDefaults.standard.set(Date(), forKey: "SDay")
                        }
                        if (UserDefaults.standard.object(forKey: "EDay") != nil){
                            dateD = UserDefaults.standard.object(forKey: "EDay") as! Date
                        }
                        else{
                            UserDefaults.standard.set(Date(), forKey: "EDay")
                        }
                    }
                
                DatePicker("Ends", selection: $dateD, displayedComponents: .hourAndMinute)
                
                Button("Save times"){
                    UserDefaults.standard.set(dateS, forKey: "SDay")
                    UserDefaults.standard.set(dateD, forKey: "EDay")
                }
            }
            Section(header: Text("Notification Times")){
                DatePicker("Non-daily notifications are sent at", selection: $dateDW, displayedComponents: .hourAndMinute)
                    .onAppear(){
                        if (UserDefaults.standard.object(forKey: "NTime") != nil){
                            dateDW = UserDefaults.standard.object(forKey: "NTime") as! Date
                        }
                        else{
                            UserDefaults.standard.set(Date(), forKey: "NTime")
                        }
                        if (UserDefaults.standard.object(forKey: "Month") != nil){
                            day = UserDefaults.standard.object(forKey: "Month") as! Int
                        }
                        else{
                            UserDefaults.standard.set(0, forKey: "Month")
                        }
                    }
                Picker("Non-daily/weekly notifications will be sent on", selection: $day){
                    ForEach(0..<7){
                        Text(type(num: $0))
                    }
                }
                .tint(.blue)
                Button("Save time and day"){
                    UserDefaults.standard.set(dateDW, forKey: "NTime")
                    UserDefaults.standard.set(day, forKey: "Month")
                }
            }
            Section(header: Text("Task Colors")){
                ColorPicker("Daily", selection: $ColorD)
                ColorPicker("Weekly", selection: $ColorW)
                ColorPicker("Monthly", selection: $ColorM)
                ColorPicker("Yearly", selection: $ColorY)
            }
        }
    }
    func type(num: Int) -> String{
        var ans = ""
        if (num == 0){
           ans = "Monday"
        }
        else if (num == 1){
            ans = "Tuesday"
        }
        else if (num == 2){
            ans = "Wensday"
        }
        else if (num == 3){
            ans = "Thursday"
        }
        else if (num == 4){
            ans = "Friday"
        }
        else if (num == 5){
            ans = "Saturday"
        }
        else{
           ans = "Sunday"
        }
        
        return ans
    }
   
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

