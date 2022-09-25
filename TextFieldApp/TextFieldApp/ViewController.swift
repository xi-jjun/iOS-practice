//
//  ViewController.swift
//  TextFieldApp
//
//  Created by 김재준 on 2022/09/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var textShowLabel: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        view.backgroundColor = #colorLiteral(red: 0.9141908288, green: 0.8648947477, blue: 0.976552546, alpha: 1)
        
        userTextField.keyboardType = UIKeyboardType.default
        userTextField.placeholder = "뭐든 적으세요"
        userTextField.borderStyle = .roundedRect
        userTextField.backgroundColor = #colorLiteral(red: 0.9718628526, green: 0.9668141007, blue: 1, alpha: 1)
        
        textShowLabel.text = "여기에 적으신 내용이 보여집니다"
        textShowLabel.numberOfLines = 0
        
        doneBtn.setTitle("Show!", for: .normal)
        doneBtn.setTitleColor(.black, for: .normal)
        doneBtn.tintColor = #colorLiteral(red: 0.9909078479, green: 0.7395697236, blue: 0.9589526057, alpha: 1)
    }
    
    /*
     text글자 내용이 한 글자씩 추가되거나 수정될 때 마다 호출이 됨
     이처럼 UITextFieldDelegate를 추가하면 다양한 함수를 써서 제어를 할 수 있음
     */
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        <#code#>
//    }
    
    func textFieldWrittenCompeleted(_ textField: UITextField) -> Bool {
        userTextField.resignFirstResponder()
        return true
    }

    @IBAction func doneBtnTapped(_ sender: UIButton) {
        textShowLabel.text = userTextField.text!
        textFieldWrittenCompeleted(userTextField)
    }
    
}

// MARK: 키보드 숨기기(단, 모든 클릭 시 키보드 숨기기 함수가 호출됨)
// 원하는 곳에 배치
//extension UIViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tap: UIGestureRecognizer = UIGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//}

