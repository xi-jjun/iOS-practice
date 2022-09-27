//
//  ViewController.swift
//  ScreenChangeApp
//
//  Created by 김재준 on 2022/09/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /**
     code로 화면 이동 : 다음 화면이 코드로 작성되어 있을 때에만 가능한 방법
     */
    @IBAction func codeBtnTapped(_ sender: UIButton) {
        let firstVC = FirstViewController() // instance 생성
        firstVC.modalPresentationStyle = .fullScreen
        firstVC.stringData = "Hello World!"
        present(firstVC, animated: true, completion: nil)
    }
    
    /**
     code로 storyboard객체 생성하여 화면이동
     */
    @IBAction func storyboardWithCodeBtnTapped(_ sender: UIButton) {
        
    }
    
    /**
     스토리보드에서의 화면이동(간접 세그웨이)
     */
    @IBAction func storyboardWithSegueBtnTapped(_ sender: UIButton) {
        
    }
    

}

