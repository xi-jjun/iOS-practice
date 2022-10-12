//
//  DataManager.swift
//  TableViewApp
//
//  Created by 김재준 on 2022/10/11.
//

import UIKit

// view controller가 요청을 했을 때 데이터 전달하는 역할
class DataManager {
    /**
     빈 배열로 만든 이유 : 일반적으로는 서버와 통신하여 받은 결과를 배열에 넣기 때문에 초기에는 비어있다.
     그냥 그렇기 때문에 비어놓은 것
     */
    private var movieDataArr: [Movie] = []
    
    func makeMovieData() {
        movieDataArr = [
            Movie(image: UIImage(named: "batman.png")!, title: "배트맨", description: "고담시티 일진 학원물. 그를 막을 사람은 없다"),
            Movie(image: UIImage(named: "spiderman.png")!, title: "스파이더맨", description: "거미줄 괴뢰군"),
            Movie(image: UIImage(named: "captain.png")!, title: "캡틴아메리카", description: "미제 가면 괴뢰군"),
            Movie(image: UIImage(named: "batman.png")!, title: "배트맨", description: "고담시티 일진 학원물. 그를 막을 사람은 없다"),
            Movie(image: UIImage(named: "batman.png")!, title: "배트맨", description: "고담시티 일진 학원물. 그를 막을 사람은 없다"),
            Movie(image: UIImage(named: "batman.png")!, title: "배트맨", description: "고담시티 일진 학원물. 그를 막을 사람은 없다")
        ]
    }
    
    func getMovieData() -> [Movie] {
        return movieDataArr
    }
}
