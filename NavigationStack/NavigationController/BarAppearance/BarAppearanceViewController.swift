//
//  BarAppearanceViewController.swift
//  NavigationController
//
//  Created by 김건우 on 11/6/23.
//

import UIKit

class BarAppearanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var container = AttributeContainer()
        container.font = UIFont.preferredFont(forTextStyle: .title1)
        container.foregroundColor = UIColor.white
        
        let standard = UINavigationBarAppearance()
        standard.backgroundColor = UIColor.systemRed
        if let keys = try? Dictionary(container, including: \.uiKit) {
            standard.titleTextAttributes = keys
            standard.largeTitleTextAttributes = keys
        }
        let compact = UINavigationBarAppearance()
        compact.backgroundColor = UIColor.systemYellow
        
        let bar = navigationController?.navigationBar
        // ⭐️ 컨텐츠를 스크롤하지 않았을 때(최상단 컨텐츠가 보일 때), 바의 디자인을 변경함.
        bar?.scrollEdgeAppearance = standard
        // ⭐️ 오리엔테이션이 Landscape 모드이고, 컨텐츠를 스크롤하지 않았을 때, 바의 디자인을 변경함.
        bar?.compactScrollEdgeAppearance = compact
        // ⭐️ 컨텐츠를 스크롤했을 때, 바의 디자인을 변경함.
//        bar?.standardAppearance = standard
        // ⭐️ 오리엔테이션이 Landscape 모드이고, 컨텐츠를 스크롤하지 않았을 때, 바의 디자인을 변경함.
//        bar?.compactAppearance = compact
    }
    
    @IBAction func showSecondVC(_ sender: UIButton) {
//        performSegue(withIdentifier: "goToSecondVC", sender: self)
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondBarAppearanceVC") {
            navigationController?.pushViewController(secondVC, animated: true)
        }
    }

}
