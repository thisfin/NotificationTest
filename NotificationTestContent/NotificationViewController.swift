//
//  NotificationViewController.swift
//  NotificationTestContent
//
//  Created by 李毅 on 2020/12/2.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    @IBOutlet var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }

    func didReceive(_ notification: UNNotification) {
        label?.text = "\(notification.request.content.body) label"
    }
}
