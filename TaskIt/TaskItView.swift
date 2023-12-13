//
//  TaskItView.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/7/23.
//

import SwiftUI

struct TaskItView: View {
    @State private var date = Date()
    @State private var add = false
    
  
    
    @AppStorage("ColorD") var ColorD: Color = .green
    @AppStorage("ColorW") var ColorW: Color = .red
    @AppStorage("ColorM") var ColorM: Color = .orange
    @AppStorage("ColorY") var ColorY: Color = .blue
    
    @Environment(\.managedObjectContext) var top
    @FetchRequest(sortDescriptors: []) var CoreArr: FetchedResults<Task>
    
    var body: some View {
        NavigationView{
            VStack {
                VStack{
                    DatePicker("Start of you day", selection: $date, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle()) //Todo: Look for a vertically oriented style of the graphical calender
                        .frame(maxHeight: 400)
                        .onAppear(){
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ success, error in
                                if success{
                                    print("All set")
                                    
                                }
                                else if let error = error{
                                    print("Broke")
                                }
                            }
                        }
                    
                }
             //Todo: wrap this into an if statement for when to show or not based on whether there are calendar events
                MultyTaskView(dat: $date) 
                
            // Optionally: based on the date; get the task and it's type(daily, weekly etc)
                //Maybe make a listview view here and display the name of the task on the left(and maybe descriptions underneath) and then to right, display the type
                
            // When you swipe the record on the list(task) to the left, you can select Edit to go to edit window,or select complete to mark it complete or you can delete the task.
                
                //Clicking the task takes you to the Task Details view. Here you can mark the task as complete or delete. On the top right of this view, should be an Edit button. When clicked, it will open another Edit view.
                
            }
            .padding()
            .navigationTitle("TaskIt")
            .toolbar{
                ToolbarItem(placement: .bottomBar){
                    NavigationLink{
                        SettingView()
                        
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    
                }
                ToolbarItem(placement: .navigationBarLeading){
                    NavigationLink{
                        EditTaskView()
                        
                    } label: {
                        HStack{
                            Image(systemName: "pencil").bold()
                            Text("Edit Tasks")
                        }
                        }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(){
                        add.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $add){
                        AddTask()
                    }
                }
                
            }
        }
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

struct TaskItView_Previews: PreviewProvider {
    static var previews: some View {
        TaskItView()
    }
}
