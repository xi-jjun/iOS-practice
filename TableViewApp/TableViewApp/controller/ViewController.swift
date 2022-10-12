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
class ViewController: UIViewController {
    
    var movieInfoList: [Movie] = []
    var movieDataManager = DataManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableView의 컨텐츠를 표시하는 대리자를 ViewController 자신으로 설정하겠다
        tableView.dataSource = self
        tableView.rowHeight = 120
        
        movieDataManager.makeMovieData()
        movieInfoList = movieDataManager.getMovieData()
    }
}

extension ViewController: UITableViewDataSource {
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
        cell.selectionStyle = .none // cell을 선택했을 때 바뀔 색을 정할 수 있다.
        
        return cell
    }
}
