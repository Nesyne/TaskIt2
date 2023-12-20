//
//  ControlData.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/13/23.
//

import Foundation
import CoreData

class ControlData: ObservableObject{
    let obj = NSPersistentContainer(name: "TaskModel")
    init(){
        obj.loadPersistentStores{ description, error in
            if error != nil {
                print("There was an error making the obj")
            }
        }
    }
}
