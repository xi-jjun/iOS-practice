//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by 김재준 on 2022/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    let gesture = UITapGestureRecognizer(target: self, action: #selector(self.someAction(sender:)))

    override func viewDidLoad() {
        super.viewDidLoad()
        let myView = UIView()
        self.view.addSubview(myView)
    }


    @IBAction func addBtnTapped(_ sender: UIButton) {
        print("ViewController - addBtnTapped() called")
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        // do other task
    }
}

