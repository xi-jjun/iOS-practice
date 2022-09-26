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
 
 3. Apple이 미리 만들어 뒀다. 터치가 일어났을 때, 한 글자 입력될 때 마다 감지하는 것 등등... 개발자 편하라고 미리 다 구현을 해놨고, 우리는 그것을 delegate pattern을 통해 사용하기만 하면 된다. 핵심코드는 숨기면서 개발자에게 다양한 기능을 제공하는 방법이기에 사용한 것 같다
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
        /**
         애초에 UIView는 UIResponder를 상속하여 만들어졌다.
         
         UIWindow는 터치나 사용자의 상호작용을 받을 수 있는 객체를 뜻한다. 그래서 First응답 객체를 지정해주는데,
         해당 UIWindow에서 첫번째로 반응할 요소를 TextField로 해주게 되면 키보드가 생기는 것.
         사용자에게 첫번째로 응답해주는게 TextField가 되고, 반응했기에 키보드가 올라오게 되는 것이다.
         */
        userTextField.becomeFirstResponder() // 키보드 바로 생성되게 설정
        
        textShowLabel.text = "여기에 적으신 내용이 보여집니다"
        textShowLabel.numberOfLines = 0
        
        doneBtn.setTitle("Show!", for: .normal)
        doneBtn.setTitleColor(.black, for: .normal)
        doneBtn.tintColor = #colorLiteral(red: 0.9909078479, green: 0.7395697236, blue: 0.9589526057, alpha: 1)
    }
    
    /*
     text글자 내용이 한 글자씩 추가되거나 수정될 때 마다 호출이 됨
     if true, allow to write
     else, can not write
     이처럼 UITextFieldDelegate를 추가하면 다양한 함수를 구현하여 제어를 할 수 있음
     */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 20
        let currentString: NSString = textField.text! as NSString
        
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    /**
     화면에 touch가 발생하면 호출되는 method
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textShowLabel.text = userTextField.text!
        userTextField?.resignFirstResponder()
    }
    
    /**
     return(키보드의 enter버튼)을 눌렀을 때 키보드 내리도록 설정.
     
     - description
     true if the text field should implement its default behavior for the return button; otherwise, false.
     버튼이 눌렸을 때 어떤 처리를 하고 싶다면 구현해서 쓰면 되는 것.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textShowLabel.text = userTextField.text!
        userTextField.resignFirstResponder() // keyboard 내리기
        return false
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
        userTextField.resignFirstResponder()
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

