//
//  ViewController.swift
//  NavigationController
//
//  Created by 김건우 on 10/16/23.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupToolbar()
        setupNavigationBar()
    }
    
    private func setupToolbar() {
        setupToolbarItem()
        setupToolbarAppearance()
    }
    
    private func setupNavigationBar() {
        setupNavigationBarItem()
        setupNavigationBarAppearance()
    }
    
    private func setupToolbarItem() {
        // 툴 바에 휴지통 버튼 추가
        let trashButton = UIBarButtonItem(image: UIImage(systemName: "trash"), primaryAction: UIAction(handler: { action in
            print("Button Pressed")
        }))
        trashButton.tintColor = UIColor.systemMint
        
        navigationController?.setToolbarHidden(false, animated: false)
        self.setToolbarItems([trashButton], animated: false)
    }
    
    private func setupToolbarAppearance() {
        // 툴 바의 모습을 선언
        let standard = UIToolbarAppearance()
        standard.backgroundColor = UIColor.yellow
        navigationController?.toolbar.scrollEdgeAppearance = standard
    }
    
    private func setupNavigationBarItem() {
        // 내베게이션 바의 오른쪽에 옵션 메뉴 추가
        let menu = UIMenu(children: [
            UIAction(title: "Option 1", handler: { _ in }),
            UIAction(title: "Option 2", handler: { _ in }),
            UIAction(title: "Option 3", handler: { _ in })
        ])
        let optionMenu = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), menu: menu)
        
        navigationItem.rightBarButtonItems = [optionMenu]
        
        // 네비게이션 바의 뒤로가기 버튼 위치에 버튼 추가(수정)
//        let backButton = UIBarButtonItem(title: "Close")
//        backButton.tintColor = UIColor.green
        
//        navigationItem.backBarButtonItem = backButton
    }
    
    private func setupNavigationBarAppearance() {
        var container = AttributeContainer()
        container.font = UIFont.preferredFont(forTextStyle: .title1)
        container.foregroundColor = UIColor.white
        
        // 뒤로가기 버튼의 모습을 선언
        let buttonAppearance = UIBarButtonItemAppearance()
        if let textAttributes = try? Dictionary(container, including: \.uiKit) {
            buttonAppearance.normal.titleTextAttributes = textAttributes
        }
        
        // Portrait에서 콘텐츠를 스크롤하지 않았을 때, 네비게이션 바의 모습을 선언
        let standard = UINavigationBarAppearance()
        standard.backgroundColor = UIColor.systemRed
        // 뒤로가기 버튼의 텍스트 스타일 변경
        standard.backButtonAppearance = buttonAppearance
        // 뒤로가기 버튼의 이미지 변경
        standard.setBackIndicatorImage(UIImage(systemName: "arrow.backward.circle"), transitionMaskImage: UIImage(systemName: "arrow.backward.circle"))
        
        // Landscape에서 콘텐츠를 스크롤하지 않았을 때, 네비게이션 바의 모습을 선언
//        if let textAttributes = try? Dictionary(container, including: \.uiKit) {
//            standard.titleTextAttributes = textAttributes
//        }
        
        //
        let compact = UINavigationBarAppearance()
        compact.backgroundColor = UIColor.yellow
        
        let bar = navigationController?.navigationBar
        // ⭐️ Portrait에서 콘텐츠를 스크롤하지 않았을 때, 내비게이션 바의 모습을 정의
        bar?.scrollEdgeAppearance = standard
        // ⭐️ Landscape에서 콘텐츠를 스크롤하지 않았을 때, 네비게이션 바의 모습을 정의
        bar?.compactScrollEdgeAppearance = compact
        
        // 타이틀을 라지로 설정
//        navigationItem.largeTitleDisplayMode = .always
        // ⭐️ 화면을 탭하면 바를 숨기도록 함.
        navigationController?.hidesBarsOnTap = true
    }
    
    @IBAction func goToSecondView(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC")
        navigationController?.pushViewController(vc, animated: true)
    }

}

