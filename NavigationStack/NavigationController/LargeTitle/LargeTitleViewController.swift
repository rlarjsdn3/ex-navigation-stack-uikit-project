//
//  LargeTitleViewController.swift
//  NavigationController
//
//  Created by 김건우 on 11/6/23.
//

import UIKit

class LargeTitleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Large Title"
        // ⭐️ 타이틀을 표시하는 스타일 설정(never, largetTitle 등)
        navigationItem.largeTitleDisplayMode = .always
    }

}
