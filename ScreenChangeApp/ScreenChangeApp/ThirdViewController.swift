//
//  ThirdViewController.swift
//  ScreenChangeApp
//
//  Created by 김재준 on 2022/09/28.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Third View Controller"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 26)
        
        return label
    }()
    
    private let backBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("BACK", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 24)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        
        return btn
    }()
    
    var data: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabelConfigure()
        backBtnConfigure()
    }

    func mainLabelConfigure() {
        view.addSubview(mainLabel)
        mainLabel.text = data
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            mainLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func backBtnConfigure() {
        view.addSubview(backBtn)
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backBtn.widthAnchor.constraint(equalToConstant: 250),
            backBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            backBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func backBtnTapped() {
        dismiss(animated: true)
    }
}
