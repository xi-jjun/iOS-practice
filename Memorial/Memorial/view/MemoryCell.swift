//
//  MemoryCell.swift
//  Memorial
//
//  Created by 김재준 on 2022/10/04.
//

import UIKit

class MemoryCell: UICollectionViewCell {
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    var commentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 32)
        label.numberOfLines = 0
        
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpMemoryCell()
        setUpImageView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpMemoryCell()
        setUpImageView()
    }
    
    func setUpMemoryCell() {
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    func setUpImageView() {
        imageView.image = UIImage(named: "죠르디 copy.png")
    }
 
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if commentLabel.text == "" {
//            commentLabel.text = memory.comment
//            bgView.backgroundColor = .black.withAlphaComponent(0.7)
//        } else {
//            bgView.backgroundColor = .clear
//            commentLabel.text = ""
//        }
//    }
}
