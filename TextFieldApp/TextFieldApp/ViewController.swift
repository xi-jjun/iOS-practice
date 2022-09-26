//
//  ViewController.swift
//  TextFieldApp
//
//  Created by 김재준 on 2022/09/25.
//

import UIKit

/**
 why delegate?
 1. 객체간 상호작용 가능 => return value에 따라 text를 더 받을지 결정하는 것
 2. textField의 내부 구현을 숨길 수 있음
 따라서 객체에서 바로 method를 호출하는 방식이 아닌, delegate의 method를 호출하여 동작하게 된다.
 let instance = MyViewController()
 instance.someMethod() => 불가능
 
 delegate.someMethod() => OK
 */
// UITextFieldDelegate protocol 채택
class ViewController: UIViewController, UITextFieldDelegate { // protocol(자격증) 추가

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var textShowLabel: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        /**
         현재 ViewController에 UITextField가 delegate로 등록.
         구현은 현재 클래스에서 하고, 동작은 delegate에 위임.
         => UITextField에는 textField라는 method가 존재. 해당 method는 delegate의 textField를 수행하도록 할 것임. 따라서! UITextField는 delegate에게 해당 method를 실행하도록 명령을 위임한다.
         
         현재 클래스에게 UITextField의 기능을 위임하는 것
         */
        userTextField.delegate = self //
        
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
     이처럼 UITextFieldDelegate를 추가하면 다양한 함수를 구현하여 제어를 할 수 있음
     */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 20
        let currentString: NSString = textField.text! as NSString
        
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func textFieldWrittenCompeleted(_ textField: UITextField) -> Bool {
        userTextField.resignFirstResponder()
        return true
    }
    
    /**
     입력을 시작하게 할지 말지를 허락해주는 기능
     if true, then write
     else, cant write
     */
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        return false
//    }

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

