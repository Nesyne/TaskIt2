//
//  TaskView.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/7/23.
//

import Foundation

import SwiftUI

struct TaskView: View  {
    @Environment(\.managedObjectContext) var CoreModel
    
    @AppStorage("ColorD") var ColorD: Color = .green
    @AppStorage("ColorW") var ColorW: Color = .red
    @AppStorage("ColorM") var ColorM: Color = .orange
    @AppStorage("ColorY") var ColorY: Color = .blue
    
   @State var defaultTitle = ""
   @State var defaultDescription = ""
   @State var boundType = 0
   @State var defaulCompleted = false
   @State var defaultType = 0
   
   @State var item : Task
 
   @State var editting = false
    
   @State var defaultColor = Color.green
    var body: some View {
      
        
        Form{
            Section{
                if editting {
               TextField("Tittle", text: $defaultTitle)
                        .overlay {
                            Rectangle()
                                .rotation(.degrees(-90))
                                .foregroundColor(defaultColor)
                                .position(x: -16,y: 5)
                            Rectangle()
                                .rotation(.degrees(-90))
                                .foregroundColor(defaultColor)
                                .position(x: -16,y: 13)
                        }
                        .onAppear(){
                            defaultFiller()
                        }
                    
                    TextField("Notes", text: $defaultDescription)
                        .overlay {
                        Rectangle()
                            .rotation(.degrees(-90))
                            .foregroundColor(defaultColor)
                            .position(x: -16,y: 5)
                        Rectangle()
                            .rotation(.degrees(-90))
                            .foregroundColor(defaultColor)
                            .position(x: -16,y: 13)
                    }
                    
                    }
                    else{
                        Text(defaultTitle).overlay {
                            Rectangle()
                                .rotation(.degrees(-90))
                                .foregroundColor(defaultColor)
                                .position(x: -16,y: 5)
                            Rectangle()
                                .rotation(.degrees(-90))
                                .foregroundColor(defaultColor)
                                .position(x: -16,y: 13)
                        }
                        .onAppear(){
                            defaultFiller()
                    }
               
                        Text(defaultDescription).overlay {
                            Rectangle()
                                .rotation(.degrees(-90))
                                .foregroundColor(defaultColor)
                                .position(x: -16,y: 5)
                            Rectangle()
                                .rotation(.degrees(-90))
                                .foregroundColor(defaultColor)
                                .position(x: -16,y: 13)
                        }

                        
                }
                
            }
            Section{
               
                    if editting == true {
                        HStack{
                        Picker("Change reminder type", selection: $defaultType){
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
                    editting.toggle()
                    item.title = defaultTitle
                    item.aboutTask = defaultDescription
                    item.remindType = Int16(defaultType+1)
                    try? CoreModel.save()
                } label: {
                    if editting {
                        Text("Done")
                    }
                    else{
                        Text("Edit")
                    }
                }
            }
            
            
        }
        
        
        }
    
    func defaultFiller(){
        boundType = Int(item.remindType)
        defaultType = boundType-1
        defaultTitle = item.title ?? "Error"
        defaultDescription = item.aboutTask ?? "Error"
        defaulCompleted = item.completed
        if (boundType == 1){
         defaultColor = ColorD
        }
        else if (boundType == 2){
            defaultColor = ColorW
        }
       else  if (boundType == 3){
           defaultColor = ColorM
        }
        else  if (boundType == 4){
            defaultColor = ColorY
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

//struct TaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskView(tittle: "Tittle", bod: "Body text and notes", type: 1, done: false)
//    }
//}
