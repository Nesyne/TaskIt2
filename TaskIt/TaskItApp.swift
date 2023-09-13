//
//  TaskItApp.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/7/23.
//

import SwiftUI

@main
struct TaskItApp: App {
    @StateObject private var TopCor = ControlData()
    var body: some Scene {
        WindowGroup {
            TaskItView()
                .environment(\.managedObjectContext, TopCor.obj.viewContext)
        }
    }
}
