//
//  ViewController.swift
//  LoginApp
//
//  Created by 김재준 on 2022/09/26.
//

import UIKit

/**
 final 추가해주는게 좋다.
 why ?
 class의 method는 struct보다 느리다. -> 동적 디스패치 때문
 table 디스패치가 일어나서 느리다.
 final을 붙여서 상속을 막아서 direct디스패치가 되게 하여 속도 향상 가능
 */
final class ViewController: UIViewController {
    private let loginView = LoginView() // <= View를 분리시켰다.
    
    /**
     기본적으로 존재하는 view를 우리가 만든 loginView로 대체하는 것.
     viewDidLoad보다 더 먼저 호출된다.
     */
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.passwordShowBtn.addTarget(self, action: #selector(showBtnTapped), for: .touchUpInside)
        loginView.loginBtn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        loginView.passwordResetBtn.addTarget(self, action: #selector(resetBtnTapped), for: .touchUpInside)
    }
    
    @objc func showBtnTapped() {
        loginView.passwordTextField.isSecureTextEntry.toggle()
//        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func loginBtnTapped() {
        print("login btn tapped!")
    }
    
    @objc func resetBtnTapped() {
        let alert = UIAlertController(title: "Password Change", message: "Do you want to change your password?", preferredStyle: .alert)
        
        let success = UIAlertAction(title: "Yes", style: .default) { success in
            print("Success to change password")
        }
        
        let fail = UIAlertAction(title: "No", style: .default) { fail in
            print("fail to change password")
        }
        
        alert.addAction(success)
        alert.addAction(fail)
        
        present(alert, animated: true) {
            print("alert screen pop up!")
        }
    }
}
