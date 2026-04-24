//
//  Notification.swift
//  mobile
//
//  Created by bartlomiejtomczyk on 25/04/2025.
//

import Foundation
import UIKit
import UserNotifications

@objc(Notification)
class Notification: NSObject {
  static func moduleName() -> String! {
    return "Notification"
  }

  @objc
  func requestPermissions() {
    let center = UNUserNotificationCenter.current()
    center.getNotificationSettings { settings in
      center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if let error = error {
          print("Error requesting notification permissions: \(error.localizedDescription)")
        }
  
        center.getNotificationSettings { newSettings in
          print("New notification settings: \(newSettings.authorizationStatus.rawValue)")
        }
      }
    }
  }

  @objc
  func showNotification(_ title: String, location body: String) {
    let center = UNUserNotificationCenter.current()

      let content = UNMutableNotificationContent()
      content.title = title
      content.body = body
      content.sound = UNNotificationSound.default
      content.userInfo = ["foreground": true]

      let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
      let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

      DispatchQueue.main.async {
        center.add(request) { error in
          if let error = error {
            print("Error adding notification request: \(error.localizedDescription)")
          } else {
            print("Notification request added successfully")
            UNUserNotificationCenter.current().delegate = self
          }
        }
      }
    
  }

  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

extension Notification: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    print("Will present notification in foreground")
    completionHandler([.banner, .sound, .badge])
  }
}
