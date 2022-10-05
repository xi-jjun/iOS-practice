//
//  ViewController.swift
//  Memorial
//
//  Created by 김재준 on 2022/09/17.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {
    
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
//    lazy var 
    
    var memories: [Memory] = [
        Memory(image: UIImage(named: "죠르디 copy.png"), comment: "죠르디가 너무 귀여웠던 날"),
        Memory(image: UIImage(named: "batman.png"), comment: "batman is comming"),
        Memory(image: UIImage(named: "doctorstrange.png"), comment: "Hello stranger"),
        Memory(image: UIImage(named: "batman.png"), comment: "AGAIN")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        setupUI()
    }
    
    func setupUI() {
        appTitleLabel.textColor = #colorLiteral(red: 1, green: 0.8522443175, blue: 0.8385878205, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.9386720061, green: 0.8820059896, blue: 1, alpha: 1)
        collectionView.backgroundColor = #colorLiteral(red: 0.9386720061, green: 0.8820059896, blue: 1, alpha: 1)
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    /**
     몇번 반복될지 정해주는 것 같음
     return : The number of sections in collectionView. default 1
     */
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 10
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseID, for: indexPath) as! MemoryCell
        
        let memory = memories[indexPath.item]
        cell.memory = memory
        
        return cell
    }
}

private enum Constants {
    static let reuseID = "memoryCell"
}
