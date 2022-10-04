//
//  ViewController.swift
//  TableViewApp
//
//  Created by 김재준 on 2022/10/04.
//

import UIKit

/**
 UITableViewDataSource 를 추가해줘야 한다. TableView와 ViewController가 소통할 수 있게 해준다.
 ex)
 cell 을 몇개를 표시해야하는지, cell내부 컨텐츠 어떻게 표시해야하는지 등등을 물어본다.
 */
class ViewController: UIViewController, UITableViewDataSource {
    
    var movieInfoList: [Movie] = [
        Movie(image: UIImage(named: "batman.png")!, title: "배트맨", description: "고담시티 일진 학원물. 그를 막을 사람은 없다"),
        Movie(image: UIImage(named: "spiderman.png")!, title: "스파이더맨", description: "거미줄 괴뢰군"),
        Movie(image: UIImage(named: "captain.png")!, title: "캡틴아메리카", description: "미제 가면 괴뢰군"),
        Movie(image: UIImage(named: "batman.png")!, title: "배트맨", description: "고담시티 일진 학원물. 그를 막을 사람은 없다"),
        Movie(image: UIImage(named: "batman.png")!, title: "배트맨", description: "고담시티 일진 학원물. 그를 막을 사람은 없다"),
        Movie(image: UIImage(named: "batman.png")!, title: "배트맨", description: "고담시티 일진 학원물. 그를 막을 사람은 없다")
    ]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableView의 컨텐츠를 표시하는 대리자를 ViewController 자신으로 설정하겠다
        tableView.dataSource = self
        tableView.rowHeight = 120
    }

    /**
     몇개의 cell을 보여주면 되는지에 대한 정보를 반환
     tableView가 ViewController에게 몇개의 정보를 보여주면 되는지 해당 메서드로 알 수 있다.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /**
         withIdentifier : 여기에 storyboard에서 설정해준 TableViewCell의 identifier 이름을 넣어줘야 한다.
         */
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! TableViewCell
        cell.mainImageView.image = movieInfoList[indexPath.row].image
        cell.titleLabel.text = movieInfoList[indexPath.row].title
        cell.descriptionLabel.text = movieInfoList[indexPath.row].description
        
        return cell
    }
}

