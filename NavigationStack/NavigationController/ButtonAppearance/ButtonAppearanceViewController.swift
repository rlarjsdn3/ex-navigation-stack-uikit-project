//
//  ButtonAppearanceViewController.swift
//  NavigationController
//
//  Created by 김건우 on 11/6/23.
//

import UIKit

class ButtonAppearanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var container = AttributeContainer()
        container.font = UIFont.preferredFont(forTextStyle: .title1)
        
        let buttonAppreance = UIBarButtonItemAppearance()
        if let keys = try? Dictionary(container, including: \.uiKit) {
            // ⭐️ 버튼의 상태에 따른 개별 모습을 정의해줘야 함(normal, disabled, hightlighted 등)
            buttonAppreance.normal.titleTextAttributes = keys
        }
        
        let standard = UINavigationBarAppearance()
        standard.backgroundColor = UIColor.systemGray4
        // ⭐️ 네비게이션 바 안에서 버튼의 모습을 정의해줄 수 있음.
        standard.backButtonAppearance = buttonAppreance
        standard.setBackIndicatorImage(UIImage(systemName: "arrow.backward.circle"), transitionMaskImage: UIImage(systemName: "arrow.backward.circle"))
        
        let compact = UINavigationBarAppearance()
        compact.backgroundColor = UIColor.systemYellow
        
        let bar = navigationController?.navigationBar
        bar?.scrollEdgeAppearance = standard
        bar?.compactScrollEdgeAppearance = compact
        
        navigationItem.largeTitleDisplayMode = .never
    }

}
