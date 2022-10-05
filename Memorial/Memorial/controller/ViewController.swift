//
//  ViewController.swift
//  Memorial
//
//  Created by 김재준 on 2022/09/17.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {
    
    private var collectionView: UICollectionView?

    lazy var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Memorial"
        label.font = .boldSystemFont(ofSize: 38)
        label.textAlignment = .center
        
        return label
    }()
    
    var memories = Data.memories
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.9386720061, green: 0.8820059896, blue: 1, alpha: 1)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        
        addSubViews(subViews: mainTitleLabel, collectionView)
        
        mainTitleLabelConstraints()
        collectionViewSetUp(collectionView: collectionView)
    }
    
    func addSubViews(subViews: UIView...) {
        subViews.forEach {
            view.addSubview($0)
        }
    }
    
    func mainTitleLabelConstraints() {
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            mainTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainTitleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func collectionViewSetUp(collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionViewConstraints(collectionView: collectionView)
        registerCollectionView(collectionView: collectionView)
    }
    
    func collectionViewConstraints(collectionView: UICollectionView) {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: mainTitleLabel.topAnchor, constant: 100),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
    }
    
    func registerCollectionView(collectionView: UICollectionView) {
        collectionView.register(MemoryCell.self, forCellWithReuseIdentifier: MemoryConstants.reuseID)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: MemoryConstants.cellWidth, height: MemoryConstants.cellHeight)
    }
    /**
     몇번 반복될지 정해주는 것 같음
     return : The number of sections in collectionView. default 1
     */
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemoryConstants.reuseID, for: indexPath) as! MemoryCell

        let memory = memories[indexPath.item]
//        cell.memory = memory
        cell.imageView.image = memory.image

        return cell
    }
}
