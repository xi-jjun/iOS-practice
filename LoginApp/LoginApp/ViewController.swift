//
//  ViewController.swift
//  LoginApp
//
//  Created by 김재준 on 2022/09/26.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - logo image view component
    private lazy var logoImageView: UIImageView = {
        let img = UIImage(named: "netflix_logo.png")
        let imgView = UIImageView(image: img)
//        imgView.frame = CGRect(x: 0, y: 0, width: 400, height: 130)
        
        return imgView
    }()

    
    // MARK: - email Text View component
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
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
        textField.addTarget(self, action: #selector(textFieldChanged(_:)), for: .editingChanged)
        
        return textField
    }()
    
    // MARK: - password Text View component
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
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
        textField.addTarget(self, action: #selector(textFieldChanged(_:)), for: .editingChanged)
        
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
    
    /**
     autolayout을 위한 코드
     */
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    lazy var stackViewCenterYConstraint = stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    lazy var logoImageViewCenterYConstraint = logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200)
    lazy var logoImageViewLeadingConstraint = logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
    lazy var logoImageViewTrailingConstraint = logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
    lazy var logoImageViewHeightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        setUpUI()
    }
    
    func setUpUI() {
        view.backgroundColor = .black
        view.addSubview(stackView) // stack view를 subview로 올리면, stack view안의 View에 대해서는 따로 subview로 추가하면 안된다.
        view.addSubview(logoImageView)
        
        logoImageComponentUIConfiguration()
        emailComponentUIConfigure()
        passwordComponentUIConfigure()
        stackViewUIConfiguration()
        passwordResetComponentUIConfigure()
    }
    
    
    // MARK: - Logo image View UIConfiguration
    func logoImageComponentUIConfiguration() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageViewCenterYConstraint,
            logoImageViewLeadingConstraint,
            logoImageViewTrailingConstraint,
            logoImageViewHeightConstraint
        ])
    }
    
    // MARK: - email View UIConfiguration
    func emailComponentUIConfigure() {
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 10),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 10),
//            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor), // auto layout을 코드로 동적 변경하기 위하여 제거
            emailInfoLabelCenterYConstraint, // <= 동적으로 바꾸기 위해 추가
            
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
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 10),
            passwordInfoLabelCenterYConstraint, // auto layout 동적 변경을 위해 변수로 추가
            
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
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackViewCenterYConstraint,
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        logoImageViewCenterYConstraint.constant = -200
        logoImageViewHeightConstraint.constant = 100
        logoImageViewLeadingConstraint.constant = 40
        logoImageViewTrailingConstraint.constant = -40
        
        stackViewCenterYConstraint.constant = 0
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        self.view.endEditing(true)
    }
}

/**
 위에 같이 넣으면 코드가 헷갈릴 수 있기 때문에 delegate pattern을 쓸 때에는 main에 추가해서 적는게 아니라
 아래와 같이 확장을 하여 쓴다. => 코드 깔끔해지고 헷갈리지 않는다
 
 UITextFieldDelegate protocol을 채택한 이유
 => 우리는 현재 '로그인 text field'를 클릭하는 순간, placeholder가 위로 올라가게 되는 애니메이션 구현하고 싶다.
 따라서 TextField에 어떤 행동을 할 때에 우리가 원하는 동작을 정의하기 위해서 사용하는 것
 */
extension ViewController: UITextFieldDelegate {
    /**
     텍스트를 입력하기 시작할 때 실행되는 함수
     */
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
//            emailInfoLabel.backgroundColor = .darkGray
            emailInfoLabel.font = .systemFont(ofSize: 11)
            emailInfoLabelCenterYConstraint.constant = -13
        }
        
        if textField == passwordTextField {
//            passwordInfoLabel.backgroundColor = .darkGray
            passwordInfoLabel.font = .systemFont(ofSize: 11)
            passwordInfoLabelCenterYConstraint.constant = -13
        }
        
        logoImageViewCenterYConstraint.constant = -250
        logoImageViewHeightConstraint.constant = 80
        logoImageViewLeadingConstraint.constant = 60
        logoImageViewTrailingConstraint.constant = -60
        
        stackViewCenterYConstraint.constant = -50
        
        UIView.animate(withDuration: 0.2, delay: 0) {
            self.view.layoutIfNeeded() // view 하위의 모든 것을 자연스럽게 움직이는 것 처럼 보이게 해주겠다 라는 것.
            // view가 layout를 즉시 업데이트 할 수 있다. => 원래 drawing cycle 기다려야 하는데 다 필요없고 업데이트
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField && textField.text == "" {
            emailInfoLabel.backgroundColor = .clear
            emailInfoLabel.font = .systemFont(ofSize: 18)
            emailInfoLabelCenterYConstraint.constant = 0
        }
        
        if textField == passwordTextField && textField.text == "" {
            passwordInfoLabel.backgroundColor = .clear
            passwordInfoLabel.font = .systemFont(ofSize: 18)
            passwordInfoLabelCenterYConstraint.constant = 0
        }
        
        logoImageViewCenterYConstraint.constant = -200
        logoImageViewHeightConstraint.constant = 100
        logoImageViewLeadingConstraint.constant = 40
        logoImageViewTrailingConstraint.constant = -40
        
        stackViewCenterYConstraint.constant = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        logoImageViewCenterYConstraint.constant = -200
        logoImageViewHeightConstraint.constant = 100
        logoImageViewLeadingConstraint.constant = 40
        logoImageViewTrailingConstraint.constant = -40
        
        stackViewCenterYConstraint.constant = 0
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        self.view.endEditing(true)
        return true
    }
    
    @objc func textFieldChanged(_ textField : UITextField) {
        if textField.text?.count == 1 && textField.text?.first == " " {
            textField.text = ""
            return
        }
        
        guard
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty else {
            loginBtn.backgroundColor = .clear
            loginBtn.isEnabled = false
            return
        }
        
        loginBtn.backgroundColor = .red
        loginBtn.isEnabled = true
    }
    
}
