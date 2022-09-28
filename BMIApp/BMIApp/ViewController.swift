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
        view.backgroundColor = #colorLiteral(red: 0.9399163127, green: 0.9399163127, blue: 0.9399163127, alpha: 1)
        inputTextFieldView.layer.cornerRadius = 5
        textFieldConfiguration()
        calculationBtnConfiguration()
    }
    
    func textFieldConfiguration() {
        weightTextField.keyboardType = .decimalPad
        heightTextField.keyboardType = .decimalPad
    }

    func calculationBtnConfiguration() {
        view.addSubview(calculationBtn)
        
        calculationBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calculationBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            calculationBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            calculationBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -360),
            calculationBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func calculateBtnTapped() {
        let bmiVC = BMIResultViewController()
//        bmiVC.modalPresentationStyle = .fullScreen
        bmiVC.weightData = Double(weightTextField.text ?? "1.0")
        bmiVC.heightData = Double(heightTextField.text ?? "1.0")
        
        present(bmiVC, animated: true)
    }
}

