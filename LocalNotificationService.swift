//
//  LocalNotificationService.swift
//  Navigation
//
//  Created by Роман Беспалов on 09.01.2023.
//

import Foundation
import UserNotifications


public class LocalNotificationService{
    
    
    
    func registerForLatestUpdateifPossible() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .provisional]) { success, error in
            
            if let error {
                print (error)
            } else {
                print("ok")
                let content = UNMutableNotificationContent()
                content.badge = 8
                content.title = "Напоминание"
                content.body = "Посмотрите последние уведомления"
                
                var dateComponents = DateComponents()
                dateComponents.hour = 19
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                center.add(request)
            }
        }
    }
}
