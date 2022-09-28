//
//  ViewController.swift
//  ScreenChangeApp
//
//  Created by 김재준 on 2022/09/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /**
     code로 화면 이동 : 다음 화면이 코드로 작성되어 있을 때에만 가능한 방법
     */
    @IBAction func codeBtnTapped(_ sender: UIButton) {
        let firstVC = FirstViewController() // instance 생성
        firstVC.modalPresentationStyle = .fullScreen
        firstVC.stringData = "Hello World!"
//        firstVC.mainLabel.text = "HEllO WORLD!" // 가능
        present(firstVC, animated: true, completion: nil)
    }
    
    /**
     code로 storyboard객체 생성하여 화면이동
     */
    @IBAction func storyboardWithCodeBtnTapped(_ sender: UIButton) {
//        let stVC = MyStoryboardViewController() : storyboard와 연결 안됨
//        => 이렇게 하면 안된다. storyboard와 controller는 heap에 각각 존재하기에 우리는 그 둘을 연결해줘야 한다
        
        // 해당 storyboard에 identifier를 stVC로 해야 한다.
        // storyboard 화면 위 검은색 바 누른 다음, 오른쪽 메뉴에서 3번째 들어가서 stotyboard ID 설정에 'stVC'로 해줘야 한다.
        guard let stVC = storyboard?.instantiateViewController(withIdentifier: "stVC") as? MyStoryboardViewController else { return } // 실제로 생성될 instance는 UIViewController보다 더 구체적인 MyStoryboardViewContoller이기에 type casting해줘야 한다.
        stVC.data = "Data is transferred!"
        
        /**
         storyboard생성시점이랑 MyStoryboardViewController의 생성 시점이 다르다. 그렇기에 모두 생성이된 다음에 연결을 해야하는데 연결이전에 mainLabel에 접근하려고 하여
         mainLabel이 생성되지 않았는데 접근을 할 수는 없기에 오류가 발생하게 되는 코드이다
         => 만약 코드로 UI를 구성했다면 접근이 가능하다.
         
         storyboard와 controller가 연결되는 순간이 바로 viewDidLoad이다
         */
//        stVC.mainLabel.text = "Can't do it"
        
        present(stVC, animated: true, completion: nil)
    }
    
    /**
     스토리보드에서의 화면이동(간접 세그웨이)
     
     segue : 화면의 이동을 담당하는 객체. 데이터를 전달하려면 prepare() method를 override해야한다
     */
    @IBAction func storyboardWithSegueBtnTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "segueVC", sender: self)
    }
    
    /**
     data의 전달을 위해 재정의한 메서드
     segue.source : 출발지 view controller
     segue.destination : 도착지 view controller
     segue.identifier : 식별자 => segue판별하기 위한 문자열
     
     performSegue가 prepare method를 자동으로 호출하는 것이다.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueVC" {
            guard let segueVC = segue.destination as? ThirdViewController else { return }
            
            segueVC.data = "이렇게 데이터 전달해야 함"
        }
    }

}

