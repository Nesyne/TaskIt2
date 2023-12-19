//
//  TaskView.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/7/23.
//

import Foundation

import SwiftUI

struct TaskView: View  {
    @Environment(\.managedObjectContext) var top
    
    @AppStorage("ColorD") var ColorD: Color = .green
    @AppStorage("ColorW") var ColorW: Color = .red
    @AppStorage("ColorM") var ColorM: Color = .orange
    @AppStorage("ColorY") var ColorY: Color = .blue
    
   @State var tittle = ""
   @State var bod = ""
   @State var type = 0
   @State var done = false
   @State var rtype = 0
   
   @State var item : Task
 
   @State var editting = false
    
   @State var color = Color.green
    var body: some View {
        
        
        Form{
            Section{
                if editting {
               TextField("Tittle", text: $tittle)
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
                            typeF()
                        }
                    
                    TextField("Notes", text: $bod)
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
                    else{
                        Text(tittle).overlay {
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
                            typeF()
                    }
               
                        Text(bod).overlay {
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
                
            }
            Section{
               
                    if editting == true {
                        HStack{
                        Picker("Change reminder type", selection: $rtype){
                            ForEach(1..<5){
                                Text(ty(One: $0))
                            }
                        }
                        .tint(.blue)
                        .onAppear(){
                            typeF()
                        }
                    }
                    
                }
            }
            Section{
                HStack{
                    Text(done ? "Completed" : "Not Completed")
                        .foregroundColor(done ? Color.green : Color.red)
                    Button{
                        done.toggle()
                        item.done = done
                        try? top.save()
                    } label: {
                        Image(systemName: done ? "circle.inset.filled" : "circle")
                            .foregroundColor(Color.black)
                    }
                    
                }
                
                }
                
            }
        .toolbar{
           
            ToolbarItem(placement: .navigationBarTrailing){
                Button(){
                    editting.toggle()
                    item.title = tittle
                    item.body = bod
                    item.cais = Int16(rtype+1)
                    try? top.save()
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
    
    func typeF(){
        type = Int(item.cais)
        rtype = type-1
        tittle = item.title ?? "Error"
        bod = item.body ?? "Error"
        done = item.done
        if (type == 1){
         color = ColorD
        }
        else if (type == 2){
            color = ColorW
        }
       else  if (type == 3){
           color = ColorM
        }
        else  if (type == 4){
            color = ColorY
         }
        else{
         //error handling
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

//struct TaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskView(tittle: "Tittle", bod: "Body text and notes", type: 1, done: false)
//    }
//}
