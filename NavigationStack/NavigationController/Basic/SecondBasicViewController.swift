//
//  SecondBasicViewController.swift
//  NavigationController
//
//  Created by 김건우 on 11/6/23.
//

import UIKit

class SecondBasicViewController: UIViewController {

    @IBOutlet weak var sliderRating: UISlider!
    @IBOutlet weak var pictureView: UIImageView!
    
    var rating: Int = 0
    var picture: String!
    weak var delegate: BasicDelegateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderRating.value = Float(rating)
        pictureView.image = UIImage(named: picture.lowercased())
    }
    
    // ⭐️ 상위 뷰 컨트롤러로 되돌아가기 전에 호출되는 메서드
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        delegate?.setupPictureRating(rating)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let value = round(sender.value)
        sliderRating.value = value
        rating = Int(value)
    }
    
}
