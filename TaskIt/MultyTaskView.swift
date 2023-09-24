//
//  MultyTaskView.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/15/23.
//

import Foundation
import SwiftUI
struct MultyTaskView: View{
    
    @AppStorage("ColorD") var ColorD: Color = .green
    @AppStorage("ColorW") var ColorW: Color = .red
    @AppStorage("ColorM") var ColorM: Color = .orange
    @AppStorage("ColorY") var ColorY: Color = .blue
    
    @Environment(\.managedObjectContext) var top
    @FetchRequest(sortDescriptors: []) var CoreArr: FetchedResults<Task>
    
    @Binding var dat: Date
    
    var body: some View {
        NavigationView{
            Form{
                
                Section("Daily Reminders"){
                    ForEach(CoreArr){ hello in
                        if (hello.cais == 1 && hello.start ?? Date()  < dat) {
                            NavigationLink{
                                TaskView(item: hello)                            }label: {
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
                }
                Section("Weekly Reminders"){
                    ForEach(CoreArr){ hello in
                        if (hello.cais == 2 && hello.start ?? Date()  < dat) {
                            NavigationLink{
                                TaskView(item: hello)                            }label: {
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
                    
                }
                Section("Monthly Reminders"){
                    ForEach(CoreArr){ hello in
                        if (hello.cais == 3 && hello.start ?? Date()  < dat) {
                            NavigationLink{
                                TaskView(item: hello)                            }label: {
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
                    
                }
                Section("Yearly Reminders"){
                    ForEach(CoreArr){ hello in
                        if (hello.cais == 4 && hello.start ?? Date()  < dat) {
                            NavigationLink{
                                TaskView(item: hello)                            }label: {
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

//struct MultyTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        var d = Data()
//        MultyTaskView(dat: $d)
//    }
//}
