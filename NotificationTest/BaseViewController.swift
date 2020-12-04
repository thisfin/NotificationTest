//
//  BaseViewController.swift
//  NotificationTest
//
//  Created by 李毅 on 2020/12/3.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = .systemBackground
    }
}
