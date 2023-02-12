//
//  ViewController.swift
//  ApiRequestApp
//
//  Created by 김재준 on 2023/02/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var requestBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
    }
    
    @IBAction func requestBtnTapped(_ sender: UIButton) {
        let requestUrl = "http://localhost:3000/test"
        let structUrl = URL(string: requestUrl)!
        
        // dataTask
        let dataTask = URLSession(configuration: .default).dataTask(with: structUrl) { (data: Data?, response: URLResponse?, error: Error?) in
            // getting Data Error
            guard error == nil else {
                print("Error occur: \(String(describing: error))")
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            
            // 통신에 성공한 경우 data에 Data 객체가 전달됩니다.
            
            // 받아오는 데이터가 json 형태일 경우,
            // json을 serialize하여 json 데이터를 swift 데이터 타입으로 변환
            // json serialize란 json 데이터를 String 형태로 변환하여 Swift에서 사용할 수 있도록 하는 것을 말합니다.
            guard let jsonToArray = try? JSONSerialization.jsonObject(with: data, options: []) else {
                print("json to Any Error")
                return
            }
            // 원하는 작업
            print(jsonToArray)
        }.resume()
    }
    
}

