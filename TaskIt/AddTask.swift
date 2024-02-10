//
//  AddTask.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/7/23.
//

import Foundation

import SwiftUI

struct AddTask: View {
    @Environment(\.managedObjectContext) var CoreModel
    @FetchRequest(sortDescriptors: []) var CoreArr: FetchedResults<Task>
    @State var defaultTitle = ""
    @State var defaultDescription = ""
    @State var defaultType = 0
    @State var defaultStart = Date()
    @State var descritption = "descritption"
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView{
            Form{
                Section {
                    
                    TextField("Task Name", text: $defaultTitle)
                    TextField("Description", text: $defaultDescription)
                }
                Section {
                    DatePicker("Starts ", selection: $defaultStart, displayedComponents: [.date, .hourAndMinute])
                }
                Section{
                    
                    Picker("Frequency", selection: $defaultType){
                        ForEach(1..<5){
                            Text(TypeToWords(Number: $0))
                        }
                        .onReceive([self.defaultType].publisher.first()) { Hello in
                            descritptionFiller(Number: Hello+1)
                         }
                    }
                    
                    .tint(.blue)
                    Text(descritption)
                    
                }
               
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(){
                        if(defaultTitle != ""){
                            let hello = Task(context: CoreModel)
                            hello.id = UUID()
                            hello.title = defaultTitle
                            hello.aboutTask = defaultDescription
                            hello.completed = false
                            hello.startdate = defaultStart
                            hello.remindType = Int16(defaultType+1)
                            try? CoreModel.save()
                            dismiss()
                        }
                    } label: {
                        Text("Add Task")
                    }
                }
                
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button(){
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                
            }
        
        }
    }
    
    func descritptionFiller(Number: Int){
        
        if (Number == 1){
            descritption = "A daily reminder type notifies you every 50th minute of the hour until you complete it. At the end of the day if you have not completed the task it will be moved to the next day."
        }
        else if (Number == 2){
            descritption = "A weekly reminder type notifies you once every day for a week. Once you hit the last day of the week, it'll turn into a daily task."
            
        }
        else if (Number == 3){
            descritption = "A monthly task will notify you once a week for a month. When you hit the last week of the month it'll turn into a weekly task."
            
        }
        else if (Number == 4){
            descritption = "A yearly task will notify you once a month. When you hit the last month of the year it'll turn into a monthly task."
            
        }
        
    }
    
    func TypeToWords(Number: Int) -> String{
        var hi = ""
        if (Number == 1){
         hi = "Daily"
        }
        else if (Number == 2){
            hi = "Weekly"
            
        }
        else if (Number == 3){
           hi = "Monthly"
            
        }
        else if (Number == 4){
            hi = "Yearly"
            
        }
    return hi
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask()
    }
}
