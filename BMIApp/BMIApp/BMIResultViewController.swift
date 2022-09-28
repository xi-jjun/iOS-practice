//
//  BMIResultViewController.swift
//  BMIApp
//
//  Created by 김재준 on 2022/09/28.
//

import UIKit

class BMIResultViewController: UIViewController {
    
    var weightData: Double?
    var heightData: Double?
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "계산 결과"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 28)
        
        return label
    }()
    
    private lazy var backBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("BACK", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 24)
        print("back button created")
        btn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("BMI View Controller is loaded")
        view.backgroundColor = .white

        resultLabelConfiguration()
        backBtnConfiguration()
    }
    
    func resultLabelConfiguration() {
        view.addSubview(resultLabel)
        
        showBMI()
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            resultLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func backBtnConfiguration() {
        view.addSubview(backBtn)
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            backBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            backBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -240),
            backBtn.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 200)
        ])
    }

    @objc func backBtnTapped() {
        print("backBtn pressed")
        dismiss(animated: true)
    }

    func calculateBMI(weight: Double, height: Double) -> Double {
        let meterHeight: Double = height / 100
        let squareHeight: Double = pow(meterHeight, 2)
        
        return weight / squareHeight
    }
    
    func showBMI() {
        var result = calculateBMI(weight: weightData!, height: heightData!)
        result *= 100
        result = Double(round(result) / 100)
        resultLabel.text = "\(result)"
    }
}
