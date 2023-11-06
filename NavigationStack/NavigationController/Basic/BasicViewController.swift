//
//  BasicViewController.swift
//  NavigationController
//
//  Created by 김건우 on 11/6/23.
//

import UIKit

protocol BasicDelegateProtocol: NSObject {
    func setupPictureRating(_ rating: Int)
}

class BasicViewController: UIViewController {

    @IBOutlet weak var pickerPictures: UIPickerView!
    var picturesList: [String]!
    var ratings: [Int]!
    var selectedPicture: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerPictures.delegate = self
        pickerPictures.dataSource = self
        
        picturesList = ["Husky", "Door"]
        ratings = [0, 0]
        selectedPicture = 0
        
        // ⭐️ 내비게이션 타이틀 설정
        navigationItem.title = "Select Picture"
        // ⭐️ 타이틀을 표시하는 스타일 설정(inline, largetTitle 등)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! SecondBasicViewController
        controller.delegate = self
        controller.picture = picturesList[selectedPicture]
        controller.rating = ratings[selectedPicture]
    }
    
    @IBAction func getPicture(_ sender: UIButton) {
        selectedPicture = pickerPictures.selectedRow(inComponent: 0)
        performSegue(withIdentifier: "goToBasicSecondVC", sender: self)
    }
    
}

extension BasicViewController: UIPickerViewDelegate { }

extension BasicViewController: UIPickerViewDataSource {
    
    // ⭐️ 열의 개수를 설정하는 델리게이트 메서드
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // ⭐️ 행의 개수를 설정하는 델리게이트 메서드
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picturesList.count
    }
    
    // ⭐️ 각 행의 타이틀을 설정하는 델리게이트 메서드
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picturesList[row]
    }
    
}

extension BasicViewController: BasicDelegateProtocol {
    
    func setupPictureRating(_ rating: Int) {
        ratings[selectedPicture] = rating
    }
    
}
