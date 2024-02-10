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
    
    @Environment(\.dismiss) var dismiss
    
    @State var startDay = Date()
    @State var endDay = Date()
    @State var timeReminder = Date()
    @State var dayReminder = 0
    var body: some View {
        NavigationView{
            Form {
          
                //make subs sections for each type of reminder and set days/time if needed
                // make the start higher
                Section(header: Text("Day start and end times")){
                    DatePicker("Starts", selection: $startDay, displayedComponents: .hourAndMinute)
                        .onAppear(){
                           load()
                        }
                    
                    DatePicker("Ends", selection: $endDay, displayedComponents: .hourAndMinute)
                        .onAppear(){
                           load()
                        }
                    
                    
                    
                }
                Section(header: Text("Notification Times")){
                    DatePicker("Non-daily notifications are sent at", selection: $timeReminder, displayedComponents: .hourAndMinute)
                        .onAppear(){
                            load()
                        }
                    Picker("Non-daily/weekly notifications will be sent on", selection: $dayReminder){
                        ForEach(0..<7){
                            Text(type(num: $0))
                        }
                    }
                    .tint(.blue)
                    
                }
                Section(header: Text("Task Colors")){
                    ColorPicker("Daily", selection: $ColorD)
                    ColorPicker("Weekly", selection: $ColorW)
                    ColorPicker("Monthly", selection: $ColorM)
                    ColorPicker("Yearly", selection: $ColorY)
                }
            }
            .toolbar{
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button(){
                        save()
                        dismiss()
                    } label: {
                        HStack{
                            Image(systemName: "chevron.backward").bold()
                            Text("TaskIt")
                        }
                    }
                }
                
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
   
    func save(){
        UserDefaults.standard.set(startDay, forKey: "SDay")
        UserDefaults.standard.set(endDay, forKey: "EDay")
        
        UserDefaults.standard.set(timeReminder, forKey: "NTime")
        UserDefaults.standard.set(dayReminder, forKey: "Month")
        
    }
    
    func load() {
        if (UserDefaults.standard.object(forKey: "SDay") != nil){
            startDay = UserDefaults.standard.object(forKey: "SDay") as! Date
        }
        else{
            UserDefaults.standard.set(Date(), forKey: "SDay")
        }
        if (UserDefaults.standard.object(forKey: "EDay") != nil){
            endDay = UserDefaults.standard.object(forKey: "EDay") as! Date
        }
        else{
            UserDefaults.standard.set(Date(), forKey: "EDay")
        }
       
        
        
        if (UserDefaults.standard.object(forKey: "NTime") != nil){
            timeReminder = UserDefaults.standard.object(forKey: "NTime") as! Date
        }
        else{
            UserDefaults.standard.set(Date(), forKey: "NTime")
        }
        if (UserDefaults.standard.object(forKey: "Month") != nil){
            dayReminder = UserDefaults.standard.object(forKey: "Month") as! Int
        }
        else{
            UserDefaults.standard.set(0, forKey: "Month")
        }
        
       
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

