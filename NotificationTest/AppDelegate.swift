//
//  AppDelegate.swift
//  NotificationTest
//
//  Created by 李毅 on 2020/12/2.
//

import Then
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.setNotificationCategories([UNNotificationCategory(identifier: "myNotificationCategory",
                                                                             actions: [UNNotificationAction(identifier: "a",
                                                                                                            title: "bbb",
                                                                                                            options: .foreground)],
                                                                             intentIdentifiers: [],
                                                                             hiddenPreviewsBodyPlaceholder: nil,
                                                                             categorySummaryFormat: nil,
                                                                             options: .customDismissAction)])
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in
            ()
        }

        UIApplication.shared.registerForRemoteNotifications()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("deviceToken: \(deviceToken.reduce("", { $0 + String(format: "%02x", $1) }))")
    }

    // 静默推送 content-available is 1
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("\(userInfo)")
    }
}

// 标准的推送代理
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .list, .banner, .badge]) // 前台推送的样式
    }
}
