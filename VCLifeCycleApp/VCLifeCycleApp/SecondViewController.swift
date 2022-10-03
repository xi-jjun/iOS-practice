//
//  SecondViewController.swift
//  VCLifeCycleApp
//
//  Created by 김재준 on 2022/10/03.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---- SecondViewController viewDidLoad() called")
        backBtn.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("---- SecondViewController viewWillAppear() called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("---- SecondViewController viewDidAppear() called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("---- SecondViewController viewWillDisappear() called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("---- SecondViewController viewDidDisappear() called")
    }
    
    deinit {
        print("---- SecondViewController deinit")
    }

    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
