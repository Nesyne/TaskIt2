//
//  TaskItApp.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/7/23.
//remain everything

import SwiftUI

@main
struct TaskItApp: App {
    @StateObject private var CoreModel = ControlData()
    var body: some Scene {
        WindowGroup {
            TaskItView()
                .environment(\.managedObjectContext, CoreModel.obj.viewContext)
        }
    }
}
