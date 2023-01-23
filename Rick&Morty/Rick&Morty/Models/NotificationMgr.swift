//
//  NotificationMgr.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/12/22.
//

import Foundation
import SwiftUI

class NotificationMgr: ObservableObject {
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if !success && error == nil {
                print("Notifications not permitted")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Rick & Morty Time"
        content.body = "Check to see what the characters have been doing"
        content.sound = UNNotificationSound.default
        var datecomponent=DateComponents()
        datecomponent.hour=00
        datecomponent.minute=00

       //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)//use this to check for notification in next 5 seconds
        
       let trigger = UNCalendarNotificationTrigger(dateMatching: datecomponent, repeats: true)
        let request = UNNotificationRequest(identifier: "Rick&Morty Notification", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        
        center.add(request)
    }
}
