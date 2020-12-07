//
//  HomeViewController.swift
//  NotificationTest
//
//  Created by 李毅 on 2020/12/2.
//

import NSObject_Rx
import RxCocoa
import SnapKit
import Then
import UIKit

class HomeViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        view.backgroundColor = .secondarySystemBackground

        _ = UIButton(type: .system).then {
            $0.setTitle("clicked", for: .normal)
            view.addSubview($0)
            $0.snp.makeConstraints { maker in
                maker.left.top.equalToSuperview().offset(50)
            }
            _ = $0.rx.tap.subscribe(onNext: {
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
                let content = UNMutableNotificationContent().then {
                    $0.title = "title"
                    $0.subtitle = "subtitle"
                    $0.body = "body"
                    $0.sound = .default
                }
                let request = UNNotificationRequest(identifier: "xxx", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("\(error)")
                    }
                }
            }).disposed(by: rx.disposeBag)
        }
    }
}
