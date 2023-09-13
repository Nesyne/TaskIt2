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
                        .datePickerStyle(GraphicalDatePickerStyle())
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
             
                MultyTaskView(dat: $date) 
                
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
