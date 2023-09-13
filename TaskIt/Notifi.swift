//
//  Notifi.swift
//  TaskIt
//
//  Created by Ryan Bindewald on 6/16/23.
//

import Foundation
import SwiftUI
class Notifi {
    
    func no(Tittle1: String, Body: String, Start: Date){
       
        let using = UNMutableNotificationContent()
        using.title = Tittle1
        using.body = Body
    
        using.sound = UNNotificationSound.default
        let trig = UNTimeIntervalNotificationTrigger(timeInterval: 0.1 , repeats: false)
        let req = UNNotificationRequest(identifier: UUID().uuidString, content: using, trigger: trig)
    }
    
    
}
