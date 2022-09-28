//
//  ViewController.swift
//  BMIApp
//
//  Created by 김재준 on 2022/09/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextFieldView: UIView!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    private let calculationBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Go to BMI", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 24)
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(calculateBtnTapped), for: .touchUpInside)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightTextField.delegate = self
        heightTextField.delegate = self
        
        view.backgroundColor = #colorLiteral(red: 0.9399163127, green: 0.9399163127, blue: 0.9399163127, alpha: 1)
        inputTextFieldView.layer.cornerRadius = 5
        inputTextFieldView.backgroundColor = .lightGray
        textFieldConfiguration()
        calculationBtnConfiguration()
    }
    
    func textFieldConfiguration() {
        weightTextField.keyboardType = .decimalPad
        heightTextField.keyboardType = .decimalPad
        
        weightTextField.placeholder = "kg"
        
        heightTextField.placeholder = "cm"
    }

    func calculationBtnConfiguration() {
        view.addSubview(calculationBtn)
        
        calculationBtn.layer.cornerRadius = 8
        calculationBtn.backgroundColor = .lightGray
        calculationBtn.setTitleColor(.white, for: .normal)
        calculationBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calculationBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            calculationBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            calculationBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -360),
            calculationBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func clearTextField() {
        weightTextField.text = ""
        heightTextField.text = ""
    }

    // MARK: - 버튼 탭 하면 BMI결과 화면으로 이동
    @objc func calculateBtnTapped() {
        let bmiVC = BMIResultViewController()
//        bmiVC.modalPresentationStyle = .fullScreen
        
        if weightTextField.text == "" || heightTextField.text == "" || Double(weightTextField.text!) == nil || Double(heightTextField.text!) == nil || Double(heightTextField.text!) == 0.0 {
            let alertVC = UIAlertController(title: "User input error", message: "숫자와 . 만 허용이 되며 키는 0cm가 될 수 없습니다", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .default)
            alertVC.addAction(ok)
            
            present(alertVC, animated: true)
            
            return
        }
        
        bmiVC.weightData = Double(weightTextField.text ?? "1.0")
        bmiVC.heightData = Double(heightTextField.text ?? "1.0")
        
        clearTextField()
        
        present(bmiVC, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    // MARK: - 키와 몸무게는 숫자와 . 만 허용
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(string) // 현재 입력하는 단일 값을 문자열로 가져온다.
        if Int(string) != nil || string == "" || string == "." {
            return true
        }
        return false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
