//
//  FirstViewController.swift
//  ScreenChangeApp
//
//  Created by 김재준 on 2022/09/27.
//

import UIKit

class FirstViewController: UIViewController {
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "FirstViewContoller"
        label.font = .boldSystemFont(ofSize: 25)
        
        return label
    }()
    
    let backBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("BACK", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        
        return btn
    }()
    
    // optional이 아니면 기본값을 못주게 되어 FirstViewController에서 생성하기 까다롭다.
    // 따라서 optional 설정을 하여 초기값을 nil로 설정한다.
    var stringData: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        mainLabelAutoLayout()
        backBtnAutoLayout()
    }
    
    func mainLabelAutoLayout() {
        view.addSubview(mainLabel)
        mainLabel.text = stringData // ViewController에서 데이터를 가져와서 FisrtViewController의 mainLabel에 넣어주는 것
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func backBtnAutoLayout() {
        view.addSubview(backBtn)
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backBtn.widthAnchor.constraint(equalToConstant: 100),
            backBtn.heightAnchor.constraint(equalToConstant: 40),
            backBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    @objc func backBtnTapped() {
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}
