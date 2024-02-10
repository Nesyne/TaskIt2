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
    @State var timeReminderW = Date()
    @State var timeReminderM = Date()
    @State var timeReminderY = Date()
    @State var dayReminderM = 0
    @State var dayReminderY = 0
    var body: some View {
        NavigationView{
            Form {
          
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
                Section(header: Text("Notification Time For weekly tasks")){
                    DatePicker("Weekly notifications are sent at", selection: $timeReminderW, displayedComponents: .hourAndMinute)
                        .onAppear(){
                            load()
                        }
                }
                
                Section(header: Text("Notification Day & Time For monthly tasks")){
                    DatePicker("Monthly notifications are sent at", selection: $timeReminderM, displayedComponents: .hourAndMinute)
                        .onAppear(){
                            load()
                        }
                    Picker("Monthly notifications will be sent on", selection: $dayReminderM){
                        ForEach(0..<7){
                            Text(type(num: $0))
                        }
                    }
                    .tint(.blue)
                    
                }
                
                Section(header: Text("Notification Day & Time For Yearly tasks")){
                    DatePicker("Yearly notifications are sent at", selection: $timeReminderY, displayedComponents: .hourAndMinute)
                        .onAppear(){
                            load()
                        }
                    Picker("Yearly notifications will be sent on", selection: $dayReminderY){
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
        
        UserDefaults.standard.set(timeReminderW, forKey: "NTimeW")
        UserDefaults.standard.set(timeReminderM, forKey: "NTimeM")
        UserDefaults.standard.set(timeReminderY, forKey: "NTimeY")
        UserDefaults.standard.set(dayReminderM, forKey: "Month")
        UserDefaults.standard.set(dayReminderY, forKey: "Year")
        
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
       
        if (UserDefaults.standard.object(forKey: "NTimeW") != nil){
            timeReminderW = UserDefaults.standard.object(forKey: "NTimeW") as! Date
        }
        else{
            UserDefaults.standard.set(Date(), forKey: "NTimeW")
        }
        
        if (UserDefaults.standard.object(forKey: "NTimeM") != nil){
            timeReminderM = UserDefaults.standard.object(forKey: "NTimeM") as! Date
        }
        else{
            UserDefaults.standard.set(Date(), forKey: "NTimeM")
        }
        
        if (UserDefaults.standard.object(forKey: "NTimeY") != nil){
            timeReminderY = UserDefaults.standard.object(forKey: "NTimeY") as! Date
        }
        else{
            UserDefaults.standard.set(Date(), forKey: "NTimeY")
        }
        
        if (UserDefaults.standard.object(forKey: "Month") != nil){
            dayReminderM = UserDefaults.standard.object(forKey: "Month") as! Int
        }
        else{
            UserDefaults.standard.set(0, forKey: "Month")
        }
        
        if (UserDefaults.standard.object(forKey: "Year") != nil){
            dayReminderY = UserDefaults.standard.object(forKey: "Year") as! Int
        }
        else{
            UserDefaults.standard.set(0, forKey: "Year")
        }
       
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

