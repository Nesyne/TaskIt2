//
//  TaskPopView.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 12/25/23.
//
import Foundation

import SwiftUI

struct TaskPopView: View  {
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
   
   @Environment(\.dismiss) var dismiss
    
   @State var item : Task
 
   //@State var editting = false
    
   @State var color = Color.green
    var body: some View {
        NavigationView{
        Form{
            Section{
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
            Section{
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
            Section{
                HStack{
                    Text(done ? "Completed" : "Not Completed")
                        .foregroundColor(done ? Color.green : Color.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Button{
                        done.toggle()
                        item.done = done
                        try? top.save()
                    } label: {
                        Image(systemName: done ? "checkmark.square" : "square")
                            .foregroundColor(Color.black)
                    }
                    
                    
                }
                
            }
            
        }
        .toolbar{
            
            ToolbarItem(placement: .navigationBarTrailing){
                Button(){
                    item.title = tittle
                    item.body = bod
                    item.cais = Int16(rtype+1)
                    try? top.save()
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
