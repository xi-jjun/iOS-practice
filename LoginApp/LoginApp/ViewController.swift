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
        
        view.addSubview(emailTextField) // 얘가 먼저 올라온 다음
        view.addSubview(emailInfoLabel) // 그 위에 얘가 와야하기 때문에 순서를 고려하여 코드를 작성해야 한다.
        
        return view
    }()
    
    // MARK: - email placeholder
    private lazy var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Email or phone number"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
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
        
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordShowBtn)
        
        return view
    }()
    
    // MARK: - password placeholder
    private lazy var passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "password"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
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
        
        btn.addTarget(self, action: #selector(showBtnTapped), for: .touchUpInside)
        
        return btn
    }()
    
    private let loginBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.isEnabled = true
        btn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginBtn])
        stView.spacing = 18
        stView.axis = .vertical
        stView.distribution = .fillEqually
        stView.alignment = .fill
        
        return stView
    }()
    
    private let passwordResetBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("Reset password", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(resetBtnTapped), for: .touchUpInside)
        
        return btn
    }()
    
    private let textViewHeight: CGFloat = 48
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        view.backgroundColor = .black
        view.addSubview(stackView) // stack view를 subview로 올리면, stack view안의 View에 대해서는 따로 subview로 추가하면 안된다.
        
        emailComponentUIConfigure()
        passwordComponentUIConfigure()
        stackViewUIConfiguration()
        passwordResetComponentUIConfigure()
    }
    
    // MARK: - email View UIConfiguration
    func emailComponentUIConfigure() {
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 10),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 10),
            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor),
            
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 10),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2)
        ])
    }
    
    // MARK: - password View UIConfiguration
    func passwordComponentUIConfigure() {
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordShowBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 10),
            passwordInfoLabel.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 5),
            passwordInfoLabel.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -5),
            passwordInfoLabel.widthAnchor.constraint(equalToConstant: 250),
            
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 10),
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 2),
            
            passwordShowBtn.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -10),
            passwordShowBtn.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordShowBtn.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15)
        ])
    }
    
    // MARK: - stack view(email, password, login btn) View UIConfiguration
    func stackViewUIConfiguration() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight * 3 + 36)
        ])
    }
    
    // MARK: - password reset btn UIConfiguration
    func passwordResetComponentUIConfigure() {
        view.addSubview(passwordResetBtn)
        
        passwordResetBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordResetBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordResetBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordResetBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func showBtnTapped() {
        passwordTextField.isSecureTextEntry.toggle()
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

