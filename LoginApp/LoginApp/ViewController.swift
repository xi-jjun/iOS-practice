//
//  ViewController.swift
//  LoginApp
//
//  Created by 김재준 on 2022/09/26.
//

import UIKit

class ViewController: UIViewController {
    
    let emailTextFieldView: UIView = { // closure의 실행이 끝나서 return하면, 그 값을 emailTextFieldView에 담는 것
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        view.addSubview(emailTextFieldView) // 현재 화면(view)에 emailTextFieldView를 loading
        
        /**
         auto layout은 외부에 선언해줘야 함
         */
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false // 자동으로 autolayout 잡아주는 기능을 꺼줘야 아래의 수동으로 설정한 정보들을 화면에 띄울 수 있다.
        
        // view.leadingAnchor를 기준으로 leadingAnchor를 20만큼 주는 constraint를 true로 한다.
        emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true // 왼쪽으로부터 떨어진 정도
        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true // 오른쪽으로부터 떨어진 정도
        emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 220).isActive = true // 위쪽으로부터 떨어진 정도
        emailTextFieldView.heightAnchor.constraint(equalToConstant: 50).isActive = true // 높이
    }


}

