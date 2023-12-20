//
//  AddTask.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/7/23.
//

import Foundation

import SwiftUI

struct AddTask: View {
    @Environment(\.managedObjectContext) var top
    @FetchRequest(sortDescriptors: []) var CoreArr: FetchedResults<Task>
    @State var tittle1 = ""
    @State var bodie1 = ""
    @State var rtype = 0
    @State var Start = Date()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView{
            VStack {
                ScrollView{
                    TextField("Task Name", text: $tittle1).padding()
                    TextField("Description", text: $bodie1).padding()
                    DatePicker("Task Start Date", selection: $Start, displayedComponents: [.date, .hourAndMinute]).padding()
                    HStack{
                        Text("Choose a reminder type")
                        Picker("Choose a reminder type", selection: $rtype){
                            ForEach(1..<5){
                                Text(ty(One: $0))
                            }
                        }
                        .tint(.blue)
                    }
              
                }
            }
            
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(){
                        if(tittle1 != ""){
                            let hello = Task(context: top)
                            hello.id = UUID()
                            hello.title = tittle1
                            hello.body = bodie1
                            hello.done = false
                            hello.start = Start
                            hello.cais = Int16(rtype+1)
                            try? top.save()
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
    func ty(One: Int) -> String{
        var hi = ""
        if (One == 1){
         hi = "Dayly"
        }
        else if (One == 2){
            hi = "Weekly"
            
        }
        else if (One == 3){
           hi = "Monthly"
            
        }
        else if (One == 4){
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
