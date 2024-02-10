//
//  TaskPopView.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 12/25/23.
//
import Foundation

import SwiftUI

struct TaskPopView: View  {
    @Environment(\.managedObjectContext) var CoreModel
    
    @AppStorage("ColorD") var ColorD: Color = .green
    @AppStorage("ColorW") var ColorW: Color = .red
    @AppStorage("ColorM") var ColorM: Color = .orange
    @AppStorage("ColorY") var ColorY: Color = .blue
    
   @State var defaultTitle = ""
   @State var defaulDescription = ""
   @State var defaultType = 0
   @State var defaulCompleted = false
   @State var boundType = 0
   
   @Environment(\.dismiss) var dismiss
    
   @State var item : Task
 
   //@State var editting = false
    
   @State var color = Color.green
    var body: some View {
        NavigationView{
        Form{
            Section{
                TextField("Tittle", text: $defaultTitle)
                    .overlay {
                        Rectangle()
                            .rotation(.degrees(-90))
                            .foregroundColor(color)
                            .position(x: -16,y: 5)
                        Rectangle()
                            .rotation(.degrees(-90))
                            .foregroundColor(color)
                            .position(x: -16,y: 13)
                    }
                    .onAppear(){
                        defaultFiller()
                    }
                
                TextField("Notes", text: $defaulDescription)
                    .overlay {
                        Rectangle()
                            .rotation(.degrees(-90))
                            .foregroundColor(color)
                            .position(x: -16,y: 5)
                        Rectangle()
                            .rotation(.degrees(-90))
                            .foregroundColor(color)
                            .position(x: -16,y: 13)
                    }
                
            }
            Section{
                HStack{
                    Picker("Change reminder type", selection: $boundType){
                        ForEach(1..<5){
                            Text(TypeToWords(Number: $0))
                        }
                    }
                    .tint(.blue)
                    .onAppear(){
                        defaultFiller()
                    }
                }
            }
            Section{
                HStack{
                    Text(defaulCompleted ? "Completed" : "Not Completed")
                        .foregroundColor(defaulCompleted ? Color.green : Color.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Button{
                        defaulCompleted.toggle()
                        item.completed = defaulCompleted
                        try? CoreModel.save()
                    } label: {
                        Image(systemName: defaulCompleted ? "checkmark.square" : "square")
                            .foregroundColor(Color.black)
                    }
                    
                    
                }
                
            }
            
        }
        .toolbar{
            
            ToolbarItem(placement: .navigationBarTrailing){
                Button(){
                    item.title = defaultTitle
                    item.aboutTask = defaulDescription
                    item.remindType = Int16(boundType+1)
                    try? CoreModel.save()
                    dismiss()
                } label: {
                    Text("Done")
                    
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
    
    func defaultFiller(){
        defaultType = Int(item.remindType)
        boundType = defaultType-1
        defaultTitle = item.title ?? "Error"
        defaulDescription = item.aboutTask ?? "Error"
        defaulCompleted = item.completed
        if (defaultType == 1){
         color = ColorD
        }
        else if (defaultType == 2){
            color = ColorW
        }
       else  if (defaultType == 3){
           color = ColorM
        }
        else  if (defaultType == 4){
            color = ColorY
         }
        else{
         //error handling
        }
        
    }
    func TypeToWords(Number: Int) -> String{
        var hi = ""
        if (Number == 1){
         hi = "Dayly"
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
