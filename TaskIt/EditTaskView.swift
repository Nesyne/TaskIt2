//
//  EditTaskView.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/28/23.
//

import SwiftUI
// AllTaskView
struct EditTaskView: View {
    @AppStorage("ColorD") var ColorD: Color = .green
    @AppStorage("ColorW") var ColorW: Color = .red
    @AppStorage("ColorM") var ColorM: Color = .orange
    @AppStorage("ColorY") var ColorY: Color = .blue
    
    @Environment(\.managedObjectContext) var top
    @FetchRequest(sortDescriptors: []) var CoreArr: FetchedResults<Task>
    
    @State var Popup1 = false
    @State var Popup2 = false
    @State var Popup3 = false
    @State var Popup4 = false
    
    //Change tittle to header
    //Hide section tittle when there are no tasks
    
    // make tasks pop-up view, go straight to edit and have a save and cancel at the top
    
    
    
    var body: some View {
            Form{
                Section("Daily Reminders"){
                    ForEach(CoreArr){ hello in
                        if (hello.cais == 1) {
                            Button(){
                                Popup1.toggle()                            }label: {
                                    HStack{
                                        VStack{
                                            
                                            Text(hello.title ?? "Error Loading")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 15))
                                                .overlay {
                                                    Rectangle()
                                                        .rotation(.degrees(-90))
                                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                                        .position(x: -16,y: 5)
                                                    Rectangle()
                                                        .rotation(.degrees(-90))
                                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                                        .position(x: -16,y: 13)
                                                }
                                                .foregroundColor(.black)
                                            
                                            Text(hello.body ?? "Error Loading")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 10))
                                                .foregroundColor(.gray)
                                                .overlay {
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
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Image(systemName: "chevron.up")
                                    }
                                    .sheet(isPresented: $Popup1){
                                        TaskPopView(item: hello)
                                    }
                            }
                               

                                .swipeActions(edge: .trailing){
                                    Button(role: .destructive){
                                        top.delete(hello)
                                        try? top.save()
                                    } label: {
                                     Image(systemName: "trash")
                                    }
                                    
                                    Button(){
                                        
                                    }label:{
                                    Label("Edit", systemImage: "pencil.circle.fill")
                                    }
                                    .tint(.orange)
                                }
                                .swipeActions(edge: .leading){
                                    Button(){
                                        hello.done.toggle()
                                        try? top.save()
                                    }label:{
                                        
                                        if hello.done == false {
                                            Label("Finish", systemImage: "checkmark")
                                        }
                                        else {
                                            Label("Un-Finish", systemImage: "multiply")
                                        }
                                        
                                    }
                                    .tint(.green)

                                }
                        }
                    }
                    
                    
                    
                }
                Section("Weekly Reminders"){
                    ForEach(CoreArr){ hello in
                        if (hello.cais == 2) {
                            Button(){
                                Popup2.toggle()                            }label: {
                                    HStack{
                                        VStack{
                                            
                                            Text(hello.title ?? "Error Loading")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 15))
                                                .overlay {
                                                    Rectangle()
                                                        .rotation(.degrees(-90))
                                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                                        .position(x: -16,y: 5)
                                                    Rectangle()
                                                        .rotation(.degrees(-90))
                                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                                        .position(x: -16,y: 13)
                                                }
                                                .foregroundColor(.black)
                                            
                                            Text(hello.body ?? "Error Loading")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 10))
                                                .foregroundColor(.gray)
                                                .overlay {
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
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Image(systemName: "chevron.up")
                                    }
                            }                                .sheet(isPresented: $Popup2){
                                    TaskPopView(item: hello)
                                }
                                .swipeActions(edge: .trailing){
                                    Button(role: .destructive){
                                        top.delete(hello)
                                        try? top.save()
                                    } label: {
                                     Image(systemName: "trash")
                                    }
                                    
                                    Button(){
                                        
                                    }label:{
                                    Label("Edit", systemImage: "pencil.circle.fill")
                                    }
                                    .tint(.orange)
                                }
                                .swipeActions(edge: .leading){
                                    Button(){
                                        hello.done.toggle()
                                        try? top.save()
                                    }label:{
                                        
                                        if hello.done == false {
                                            Label("Finish", systemImage: "checkmark")
                                        }
                                        else {
                                            Label("Un-Finish", systemImage: "multiply")
                                        }
                                        
                                    }
                                    .tint(.green)

                                }
                        }
                    }
                    
                }
                Section("Monthly Reminders"){
                    ForEach(CoreArr){ hello in
                        if (hello.cais == 3) {
                            Button(){
                                Popup3.toggle()                            }label: {
                                    HStack{
                                        VStack{
                                            
                                            Text(hello.title ?? "Error Loading")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 15))
                                                .overlay {
                                                    Rectangle()
                                                        .rotation(.degrees(-90))
                                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                                        .position(x: -16,y: 5)
                                                    Rectangle()
                                                        .rotation(.degrees(-90))
                                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                                        .position(x: -16,y: 13)
                                                }
                                                .foregroundColor(.black)
                                            
                                            Text(hello.body ?? "Error Loading")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 10))
                                                .foregroundColor(.gray)
                                                .overlay {
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
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Image(systemName: "chevron.up")
                                    }
                            }    .sheet(isPresented: $Popup3){
                                TaskPopView(item: hello)
                            }
                                .swipeActions(edge: .trailing){
                                    Button(role: .destructive){
                                        top.delete(hello)
                                        try? top.save()
                                    } label: {
                                     Image(systemName: "trash")
                                    }
                                    
                                    Button(){
                                        
                                    }label:{
                                    Label("Edit", systemImage: "pencil.circle.fill")
                                    }
                                    .tint(.orange)
                                }
                                .swipeActions(edge: .leading){
                                    Button(){
                                        hello.done.toggle()
                                        try? top.save()
                                    }label:{
                                        
                                        if hello.done == false {
                                            Label("Finish", systemImage: "checkmark")
                                        }
                                        else {
                                            Label("Un-Finish", systemImage: "multiply")
                                        }
                                        
                                    }
                                    .tint(.green)

                                }
                        }
                    }
                    
                }
                Section("Yearly Reminders"){
                    ForEach(CoreArr){ hello in
                        if (hello.cais == 4) {
                            Button(){
                                Popup4.toggle()                            }label: {
                                    HStack{
                                        VStack{
                                            
                                            Text(hello.title ?? "Error Loading")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 15))
                                                .overlay {
                                                    Rectangle()
                                                        .rotation(.degrees(-90))
                                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                                        .position(x: -16,y: 5)
                                                    Rectangle()
                                                        .rotation(.degrees(-90))
                                                        .foregroundColor(Colors(Num: Int((hello.cais))))
                                                        .position(x: -16,y: 13)
                                                }
                                                .foregroundColor(.black)
                                            
                                            Text(hello.body ?? "Error Loading")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 10))
                                                .foregroundColor(.gray)
                                                .overlay {
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
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Image(systemName: "chevron.up")
                                    }
                            }                                .sheet(isPresented: $Popup4){
                                    TaskPopView(item: hello)
                                }
                                .swipeActions(edge: .trailing){
                                    Button(role: .destructive){
                                        top.delete(hello)
                                        try? top.save()
                                    } label: {
                                     Image(systemName: "trash")
                                    }
                                    
                                    Button(){
                                        
                                    }label:{
                                    Label("Edit", systemImage: "pencil.circle.fill")
                                    }
                                    .tint(.orange)
                                }
                                .swipeActions(edge: .leading){
                                    Button(){
                                        hello.done.toggle()
                                        try? top.save()
                                    }label:{
                                        
                                        if hello.done == false {
                                            Label("Finish", systemImage: "checkmark")
                                        }
                                        else {
                                            Label("Un-Finish", systemImage: "multiply")
                                        }
                                        
                                    }
                                    .tint(.green)

                                }
                        }
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
