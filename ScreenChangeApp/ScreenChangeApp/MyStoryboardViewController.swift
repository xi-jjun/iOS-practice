//
//  MyStoryboardViewController.swift
//  ScreenChangeApp
//
//  Created by 김재준 on 2022/09/27.
//

import UIKit

class MyStoryboardViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.text = data
    }

    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
