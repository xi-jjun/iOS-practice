//
//  ViewController.swift
//  LoginApp
//
//  Created by 김재준 on 2022/09/26.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - email Text View component
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
        
        return view
    }()
    
    // MARK: - email placeholder
    private lazy var emailInfoLabel: UILabel = {
        let label = UILabel()
        //        label.text = "Email or phone number"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - email text field
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        textField.textColor = .white
        textField.tintColor = .white
        textField.autocorrectionType = .no // 자동으로 틀린글자 잡아줄 것인지?
        textField.autocapitalizationType = .none // 자동으로 첫 글자를 대문자로 할 것인지?
        textField.spellCheckingType = .no // 스펠링체크 할 것인지?
        textField.keyboardType = .emailAddress
        
        return textField
    }()
    
    // MARK: - password Text View component
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordShowBtn)
        
        return view
    }()
    
    // MARK: - password placeholder
    private lazy var passwordInfoLabel: UILabel = {
        let label = UILabel()
        //        label.text = "password"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - password text field
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        textField.textColor = .white
        textField.tintColor = .white
        textField.autocorrectionType = .no // 자동으로 틀린글자 잡아줄 것인지?
        textField.autocapitalizationType = .none // 자동으로 첫 글자를 대문자로 할 것인지?
        textField.spellCheckingType = .no // 스펠링체크 할 것인지?
        textField.clearsOnBeginEditing = false // 다시 textField 터치했을 때 다 지우고 시작할 것인지?
        
        return textField
    }()
    
    // MARK: - passwordShowBtn
    private let passwordShowBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("show", for: .normal)
        btn.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        btn.addTarget(self, action: #selector(ViewController.showBtnTapped), for: .touchUpInside)
        
        return btn
    }()
    
    private let loginBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    // MARK: - email View UIConfiguration
    func emailComponentUIConfigure() {
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
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -20).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 5).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 10).isActive = true // 왼쪽으로부터 떨어진 정도
        emailInfoLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        emailInfoLabel.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 5).isActive = true // 위쪽으로부터 떨어진 정도
        emailInfoLabel.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -5).isActive = true
    }
    
    // MARK: - password View UIConfiguration
    func passwordComponentUIConfigure() {
        view.addSubview(passwordTextFieldView)
        
        passwordTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFieldView.topAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 10).isActive = true
        passwordTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordTextFieldView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -20).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 5).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 10).isActive = true
        passwordInfoLabel.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 5).isActive = true
        passwordInfoLabel.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -5).isActive = true
        passwordInfoLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        passwordShowBtn.translatesAutoresizingMaskIntoConstraints = false
        passwordShowBtn.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -20).isActive = true
        passwordShowBtn.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 5).isActive = true
        passwordShowBtn.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -5).isActive = true
        passwordShowBtn.widthAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setUpUI() {
        view.backgroundColor = .black
        
        emailComponentUIConfigure()
        passwordComponentUIConfigure()
        
        
        
    }
    
    @objc func showBtnTapped() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func loginButtonTapped() {
        print("login btn tapped!")
    }
}

