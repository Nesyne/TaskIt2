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

            Section(header: Text("Your Start and stop time for a day")){
                DatePicker("The start of your day", selection: $dateS, displayedComponents: .hourAndMinute)
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
                
                DatePicker("The end of your day", selection: $dateD, displayedComponents: .hourAndMinute)
                
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
                Button("Save time and day"){
                    UserDefaults.standard.set(dateDW, forKey: "NTime")
                    UserDefaults.standard.set(day, forKey: "Month")
                }
            }
            Section(header: Text("Reminder Color")){
                ColorPicker("Daily Color Code", selection: $ColorD)
                ColorPicker("Weekly Color Code", selection: $ColorW)
                ColorPicker("Monthly Color Code", selection: $ColorM)
                ColorPicker("Yearly Color Code", selection: $ColorY)
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

