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
//        notificationCenter.setNotificationCategories([UNNotificationCategory(identifier: "myNotificationCategory",
//                                                                             actions: [UNNotificationAction(identifier: "aaa",
//                                                                                                            title: "aaa",
//                                                                                                            options: .foreground)],
//                                                                             intentIdentifiers: [],
//                                                                             hiddenPreviewsBodyPlaceholder: nil,
//                                                                             categorySummaryFormat: nil,
//                                                                             options: .customDismissAction)])
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in
            ()
        }
        notificationCenter.getNotificationSettings { _ in
            ()
        }

        // https://www.jiguang.cn
//        JPUSHService.register(forRemoteNotificationConfig: JPUSHRegisterEntity().then {
//            $0.types = NSInteger(JPAuthorizationOptions.alert.rawValue |
//                JPAuthorizationOptions.badge.rawValue |
//                JPAuthorizationOptions.sound.rawValue |
//                JPAuthorizationOptions.providesAppNotificationSettings.rawValue)
//        }, delegate: self)
//
//        JPUSHService.register(forRemoteNotificationTypes: JPAuthorizationOptions.alert.rawValue |
//            JPAuthorizationOptions.badge.rawValue |
//            JPAuthorizationOptions.sound.rawValue |
//            JPAuthorizationOptions.providesAppNotificationSettings.rawValue,
//            categories: [UNNotificationCategory(identifier: "myNotificationCategory",
//                                                actions: [UNNotificationAction(identifier: "aaa",
//                                                                               title: "aaa",
//                                                                               options: .foreground)],
//                                                intentIdentifiers: [],
//                                                hiddenPreviewsBodyPlaceholder: nil,
//                                                categorySummaryFormat: nil,
//                                                options: .customDismissAction)])
//
//        JPUSHService.registrationIDCompletionHandler { resCode, registrationID in
//            print("\(resCode) \(registrationID ?? "errorID")")
//        }
//
//        JPUSHService.setAlias("wenyou", completion: { iResCode, iAlias, seq in
//            print("\(iResCode) \(iAlias ?? "") \(seq)")
//        }, seq: 0)
//
//        JPUSHService.setup(withOption: launchOptions, appKey: "1bc78bc2376f2a3be66f97d5", channel: "Publish channel", apsForProduction: false)
//        "3757a70808011905377359a4"

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        JPUSHService.registerDeviceToken(deviceToken)
    }

    // 静默推送 content-available is 1
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("\(userInfo)")
    }
}

// 极光推送的扩展代理
//extension AppDelegate: JPUSHRegisterDelegate {
//    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, willPresent notification: UNNotification!, withCompletionHandler completionHandler: ((Int) -> Void)!) {
//        completionHandler(Int(UNNotificationPresentationOptions.sound.rawValue |
//                UNNotificationPresentationOptions.list.rawValue |
//                UNNotificationPresentationOptions.banner.rawValue |
//                UNNotificationPresentationOptions.badge.rawValue))
//    }
//
//    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, didReceive response: UNNotificationResponse!, withCompletionHandler completionHandler: (() -> Void)!) {
//        completionHandler()
//    }
//
//    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, openSettingsFor notification: UNNotification!) {
//        ()
//    }
//
//    // iOS 12
//    func jpushNotificationAuthorization(_ status: JPAuthorizationStatus, withInfo info: [AnyHashable: Any]!) {
//        ()
//    }
//}

// 标准的推送代理
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .list, .banner, .badge]) // 前台推送的样式
    }
}
