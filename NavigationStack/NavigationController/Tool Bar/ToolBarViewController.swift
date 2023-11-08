//
//  ToolBarViewController.swift
//  NavigationController
//
//  Created by 김건우 on 11/6/23.
//

import UIKit

class ToolBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let standard = UIToolbarAppearance()
        standard.backgroundColor = UIColor.yellow
        navigationController?.toolbar.scrollEdgeAppearance = standard
        
        let button = UIBarButtonItem(image: UIImage(systemName: "pencil"), primaryAction: UIAction(handler: { _ in
            print("Button Pressed")
        }))
        button.tintColor = UIColor.systemRed
        setToolbarItems([button], animated: false)
    }

}
