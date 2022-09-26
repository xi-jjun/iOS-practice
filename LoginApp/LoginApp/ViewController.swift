//
//  ViewController.swift
//  LoginApp
//
//  Created by 김재준 on 2022/09/26.
//

import UIKit

class ViewController: UIViewController {
    
    let emailTextFieldView: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        emailTextFieldView.backgroundColor = UIColor.darkGray
        view.addSubview(emailTextFieldView) // 현재 화면(view)에 loading
        
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false // 자동으로 autolayout 잡아주는 기능을 꺼줘야 아래의 수동으로 설정한 정보들을 화면에 띄울 수 있다.
        
        // view.leadingAnchor를 기준으로 leadingAnchor를 20만큼 주는 constraint를 true로 한다.
        emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true // 왼쪽으로부터 떨어진 정도
        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true // 오른쪽으로부터 떨어진 정도
        emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true // 위쪽으로부터 떨어진 정도
        emailTextFieldView.heightAnchor.constraint(equalToConstant: 50).isActive = true // 높이
        
        // border 둥글게
        emailTextFieldView.layer.cornerRadius = 10
        emailTextFieldView.layer.masksToBounds = true
    }


}

