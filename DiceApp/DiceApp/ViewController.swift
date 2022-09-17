//
//  ViewController.swift
//  DiceApp
//
//  Created by 김재준 on 2022/09/17.
//

import UIKit // UIKit이 Foundation framework를 포함한다.

class ViewController: UIViewController {
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    var diceImgList: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollBtnTapped(_ sender: UIButton) {
        leftImageView.image = diceImgList.randomElement()!
        rightImageView.image = diceImgList.randomElement()!
    }
}

