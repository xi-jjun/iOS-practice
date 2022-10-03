//
//  ViewController.swift
//  VCLifeCycleApp
//
//  Created by 김재준 on 2022/10/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goBtn: UIButton!
    
    /**
     view를 memory에 올리는 과정
     view를 바꿀 수 있는 시점이다.
     
     code로 view를 구성했을 때 쓸 수 있다. storyboard로 화면을 구성했다면 호출하면 안된다
     */
//    override func loadView() {
//        print("ViewController loadView() called")
//    }
    
    /**
     view 가 생성됐을 때 한번만 호출
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController viewDidLoad() called")
        goBtn.layer.cornerRadius = 8
    }
    
    /**
     실제 화면에 view가 나타나기 전에 호출
     => 사용자가 보기 전 할 수 있는 것들을 수행
        ex) 화면 설정
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController viewWillAppear() called")
    }
    
    /**
     실제 화면에 view가 나타난 후에 호출
     => 애니메이션 시작, 타이머 시작...
     만약 애니메이션을 화면 나타날 때 마다 효과를 주고 싶다면 여기에 구현하는게 맞다
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController viewDidAppear() called")
    }
    
    /**
     실제 화면에 view가 사라지기 전에 호출
     => 애니메이션 멈춤
     */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController viewWillDisappear() called")
    }
    
    /**
     실제 화면에 view가 사라진 후에 호출
     BUT! memory에서 사라진 것은 아니다
     */
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController viewDidDisappear() called")
    }
    
    // view를 memory에서 제거
    deinit {
        print("ViewController deinit")
    }
    

    @IBAction func goBtnTapped(_ sender: UIButton) {
        
    }
    
    /**
     직접 segue방식으로 (storyboard와 button을 직접 연결)했을 경우 호출되는 메서드
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
    }
}

