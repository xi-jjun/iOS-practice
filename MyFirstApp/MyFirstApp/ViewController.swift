//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 김재준 on 2022/09/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var touchBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedBtn(_ sender: UIButton) {
        let nowLabel = mainLabel.text
        if nowLabel == "Welcome" {
            mainLabel.text = "Hello iOS!"
            mainLabel.textColor = .white
            mainLabel.backgroundColor = .black
            touchBtn.backgroundColor = .white
            touchBtn.setTitleColor(UIColor.black, for: .normal)
        } else {
            mainLabel.text = "Welcome"
            mainLabel.textColor = .black
            mainLabel.backgroundColor = .white
            touchBtn.backgroundColor = .black
            touchBtn.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
}

