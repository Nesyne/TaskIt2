//
//  CaseNotifi.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/27/23.
//

import Foundation
import SwiftUI
class CaseNotifi {
    @Environment(\.managedObjectContext) var top
    @FetchRequest(sortDescriptors: []) var CoreArr: FetchedResults<Task>
    @State var todaysDate = Date()
     @State var dateFormatter = DateFormatter()
    @State var dateInFormat = "hello"
    func run(){
        dateFormatter.dateFormat = "HH:mm"
        dateInFormat = dateFormatter.string(from: todaysDate)
       
        ForEach(CoreArr){ hello in
            if(hello.done == false){
                if(hello.cais == 1){
                    if(self.dateInFormat.components(separatedBy: ":").last ?? "ERROR" == "50"){
                        //noti.no(Tittle1: hello.title ?? "Error", Body: hello.body ?? "Error", Start: Date.now)
                        Text("hello")
                    }
                }
                else if(hello.cais == 2){
                    
                }
                else if(hello.cais == 3){
                    
                }
                else if(hello.cais == 4){
                    
                }
            }
        }
    }
    
    
    
}
