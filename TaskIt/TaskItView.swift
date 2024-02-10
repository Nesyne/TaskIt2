//
//  TaskItView.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/7/23.
//

import SwiftUI

struct TaskItView: View {
    @State private var CurrentDate = Date()
    @State private var addTask = false
    
  
    
    @AppStorage("ColorD") var ColorD: Color = .green
    @AppStorage("ColorW") var ColorW: Color = .red
    @AppStorage("ColorM") var ColorM: Color = .orange
    @AppStorage("ColorY") var ColorY: Color = .blue
    
    @Environment(\.managedObjectContext) var CoreModel
    @FetchRequest(sortDescriptors: []) var CoreArr: FetchedResults<Task>
    
    //fix color rectangle
    // put small space between items
    //make color bar thiner
    // put start day under item type
    
    var body: some View {
        NavigationView{
            VStack {
                VStack{
                    DatePicker("Start of you day", selection: $CurrentDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(maxHeight: 400)
                        .onAppear(){
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ success, error in
                                if success{
                                    print("All set")
                                }
                                else if error != nil{
                                    print("Broke")
                                }
                            }
                        }
                    
                }
            
                VStack{
                  Form{
                      //Hide section header when there are tasks tasks
                      Section("Tasks will be show here"){
                          List{
                          ForEach(CoreArr){ hello in
                              if (hello.startdate ?? Date() < CurrentDate) {
                                  NavigationLink{
                                      TaskView(item: hello)                            }label: {
                                          VStack{
                                              HStack{
                                                  
                                                  Text(hello.title ?? "Error Loading")
                                                      .frame(maxWidth: .infinity, alignment: .leading)
                                                      .font(.system(size: 15))
                                                      .overlay {
                                                          Rectangle()
                                                              .rotation(.degrees(-90))
                                                              .foregroundColor(TypeToColors(Number: Int((hello.remindType))))
                                                              .position(x: -16,y: 5)
                                                          Rectangle()
                                                              .rotation(.degrees(-90))
                                                              .foregroundColor(TypeToColors(Number: Int((hello.remindType))))
                                                              .position(x: -16,y: 13)
                                                      }
                                                  Text(TypeToWords(Number: Int(hello.remindType)))
                                                      .font(.system(size: 10))
                                                      .foregroundColor(TypeToColors(Number: Int((hello.remindType))))
                                              }
                                              HStack{
                                                  Text(hello.aboutTask ?? "Error Loading")
                                                      .frame(maxWidth: .infinity, alignment: .leading)
                                                      .font(.system(size: 10))
                                                      .foregroundColor(.gray)
                                                      .overlay {
                                                          Rectangle()
                                                              .rotation(.degrees(-90))
                                                              .foregroundColor(TypeToColors(Number: Int((hello.remindType))))
                                                              .position(x: -16,y: 5)
                                                          Rectangle()
                                                              .rotation(.degrees(-90))
                                                              .foregroundColor(TypeToColors(Number: Int((hello.remindType))))
                                                              .position(x: -16,y: 13)
                                                      }
                                                  
                                                  Text(hello.startdate ?? Date.now, style: .date)
                                                      .font(.system(size: 10))
                                                      .foregroundColor(.gray)
                                                  
                                              }
                                          }
                                          
                                          
                                          
                                      }
                                  
                                      .swipeActions(edge: .trailing){
                                          Button(role: .destructive){
                                              CoreModel.delete(hello)
                                              try? CoreModel.save()
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
                                              hello.completed.toggle()
                                              try? CoreModel.save()
                                          }label:{
                                              
                                              if hello.completed == false {
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
                }
                
                //Todo: wrap this into an if statement for when to show or not based on whether there are calendar events
                
            // Optionally: based on the date; get the task and it's type(daily, weekly etc)
                //Maybe make a listview view here and display the name of the task on the left(and maybe descriptions underneath) and then to right, display the type
                
            // When you swipe the record on the list(task) to the left, you can select Edit to go to edit window,or select complete to mark it complete or you can delete the task.
                
                //Clicking the task takes you to the Task Details view. Here you can mark the task as complete or delete. On the top right of this view, should be an Edit button. When clicked, it will open another Edit view.
                
            }
            .padding()
            .navigationTitle("TaskIt")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(){
                        addTask.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $addTask){
                        AddTask()
                    }
                }

                ToolbarItem(placement: .bottomBar){
                    NavigationLink{
                        AllTaskView()
                            .navigationTitle("All Tasks")
                        
                    } label: {
                        HStack{
                            Image(systemName: "list.dash").bold()
                        }
                        }
                    
                }
                ToolbarItem(placement: .bottomBar){
                    NavigationLink{
                        SettingView()
                            .navigationBarBackButtonHidden(true)
                        
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    
                }
                
               

                
            }
        }
    }
 
    func TypeToWords(Number: Int) -> String{
        var hi = ""
        if (Number == 1){
         hi = "DAILY"
        }
        else if (Number == 2){
            hi = "WEEKLY"
            
        }
        else if (Number == 3){
           hi = "MONTHLY"
            
        }
        else if (Number == 4){
            hi = "YEARLY"
            
        }
    return hi
    }
    
    func TypeToColors(Number: Int) -> Color{
        var col = Color.gray
        if (Number == 1){
            col = ColorD
        }
        else if (Number == 2){
            col = ColorW
        }
        else  if (Number == 3){
            col = ColorM
        }
        else  if (Number == 4){
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
