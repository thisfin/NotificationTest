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
        JPUSHService.register(forRemoteNotificationConfig: JPUSHRegisterEntity().then {
            $0.types = NSInteger(JPAuthorizationOptions.alert.rawValue |
                JPAuthorizationOptions.badge.rawValue |
                JPAuthorizationOptions.sound.rawValue |
                JPAuthorizationOptions.providesAppNotificationSettings.rawValue)
        }, delegate: self)

        JPUSHService.setup(withOption: launchOptions, appKey: "1bc78bc2376f2a3be66f97d5", channel: "Publish channel", apsForProduction: false)
//"3757a70808011905377359a4"
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        JPUSHService.registerDeviceToken(deviceToken)
    }
}

extension AppDelegate: JPUSHRegisterDelegate {
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, willPresent notification: UNNotification!, withCompletionHandler completionHandler: ((Int) -> Void)!) {
        ()
    }

    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, didReceive response: UNNotificationResponse!, withCompletionHandler completionHandler: (() -> Void)!) {
        ()
    }

    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, openSettingsFor notification: UNNotification!) {
        ()
    }

    func jpushNotificationAuthorization(_ status: JPAuthorizationStatus, withInfo info: [AnyHashable: Any]!) {
        ()
    }
}
