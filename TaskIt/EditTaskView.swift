//
//  EditTaskView.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/28/23.
//

import SwiftUI

struct EditTaskView: View {
    @AppStorage("ColorD") var ColorD: Color = .green
    @AppStorage("ColorW") var ColorW: Color = .red
    @AppStorage("ColorM") var ColorM: Color = .orange
    @AppStorage("ColorY") var ColorY: Color = .blue
    
    @Environment(\.managedObjectContext) var top
    @FetchRequest(sortDescriptors: []) var CoreArr: FetchedResults<Task>
    
    var body: some View {
        NavigationView{
            Form{
                Text("Swipe to delete tasks")
                Section("Daily Reminders"){
                    ForEach(CoreArr){ hello in
                        if (hello.cais == 1) {
                            NavigationLink{
                                TaskView(tittle: (hello.title ?? "Error Loading"), bod: (hello.body ?? "Error Loading"), type: Int((hello.cais)), done: (hello.done))
                            }label: {
                                Text(hello.title ?? "Error Loading").overlay {
                                    Rectangle()
                                        .rotation(.degrees(-90))
                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                        .position(x: -16,y: 5)
                                    Rectangle()
                                        .rotation(.degrees(-90))
                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                        .position(x: -16,y: 13)
                                }
                            }
                        }
                    }
                    .onDelete(perform: dellt)
                }
                Section("Weekly Reminders"){
                    ForEach(CoreArr){ hello in
                        if (hello.cais == 2) {
                            NavigationLink{
                                TaskView(tittle: (hello.title ?? "Error Loading"), bod: (hello.body ?? "Error Loading"), type: Int((hello.cais)), done: (hello.done))
                            }label: {
                                Text(hello.title ?? "Error Loading").overlay {
                                    Rectangle()
                                        .rotation(.degrees(-90))
                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                        .position(x: -16,y: 5)
                                    Rectangle()
                                        .rotation(.degrees(-90))
                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                        .position(x: -16,y: 13)
                                }
                            }
                        }
                    }
                    .onDelete(perform: dellt)
                    
                }
                Section("Monthly Reminders"){
                    ForEach(CoreArr){ hello in
                        if (hello.cais == 3) {
                            NavigationLink{
                                TaskView(tittle: (hello.title ?? "Error Loading"), bod: (hello.body ?? "Error Loading"), type: Int((hello.cais)), done: (hello.done))
                            }label: {
                                Text(hello.title ?? "Error Loading").overlay {
                                    Rectangle()
                                        .rotation(.degrees(-90))
                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                        .position(x: -16,y: 5)
                                    Rectangle()
                                        .rotation(.degrees(-90))
                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                        .position(x: -16,y: 13)
                                }
                            }
                        }
                    }.onDelete(perform: dellt)
                    
                }
                Section("Yearly Reminders"){
                    ForEach(CoreArr){ hello in
                        if (hello.cais == 4) {
                            NavigationLink{
                                TaskView(tittle: (hello.title ?? "Error Loading"), bod: (hello.body ?? "Error Loading"), type: Int((hello.cais)), done: (hello.done))
                            }label: {
                                Text(hello.title ?? "Error Loading").overlay {
                                    Rectangle()
                                        .rotation(.degrees(-90))
                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                        .position(x: -16,y: 5)
                                    Rectangle()
                                        .rotation(.degrees(-90))
                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                        .position(x: -16,y: 13)
                                }
                            }
                        }
                    }.onDelete(perform: dellt)
                    
                }
                
            }
        }
    }
    
    func dellt(at offset: IndexSet){
        for offset in offset{
        let no = CoreArr[offset]
            top.delete(no)
        }
        try? top.save()
        
       
        
    }
    
    func Colors(Num: Int) -> Color{
        var col = Color.gray
        if (Num == 1){
            col = ColorD
        }
        else if (Num == 2){
            col = ColorW
        }
        else  if (Num == 3){
            col = ColorM
        }
        else  if (Num == 4){
            col = ColorY
        }
        else{
            
        }
        return col
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView()
    }
}
