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
  func showNotification(_ title: String, location body: String) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound.default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)

    let request = UNNotificationRequest(identifier: "requestName", content: content, trigger: trigger)

    let center = UNUserNotificationCenter.current()
    DispatchQueue.main.async {
      center.add(request) { error in
        if let error = error {
          print("Error adding notification request: \(error.localizedDescription)")
        }
      }
    }
  }

  // MARK: - RCTBridgeModule

  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
