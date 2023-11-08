//
//  BarButtonsViewController.swift
//  NavigationController
//
//  Created by 김건우 on 11/6/23.
//

import UIKit

class BarButtonsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let trashButton = UIBarButtonItem(image: UIImage(systemName: "trash"), primaryAction: UIAction(handler: { action in
            print("Button Pressed")
        }))
        trashButton.tintColor = UIColor.systemRed
        
        let backButton = UIBarButtonItem(title: "Close")
        
        // ⭐️ 뒤로가기 버튼 기능은 NavigationController가 정의해주므로, 별도 기능 구현은 필요 없음.
        navigationItem.backBarButtonItem = backButton
        navigationItem.rightBarButtonItems = [trashButton]
    }

}
