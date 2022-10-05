//
//  MemoryCell.swift
//  Memorial
//
//  Created by 김재준 on 2022/10/04.
//

import UIKit

class MemoryCell: UICollectionViewCell {
    
//    lazy var imageShowView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 10
//        imageView.layer.masksToBounds = true
//
//        return imageView
//    }()

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    
    var memory: Memory! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let memory = memory {
            imageView.image = memory.image
            bgView.backgroundColor = .black.withAlphaComponent(0.8)
            commentLabel.text = memory.comment
        } else {
            imageView.image = nil
            bgView.backgroundColor = nil
            commentLabel.text = nil
        }
        
        commentLabel.numberOfLines = 0
        bgView.layer.cornerRadius = 20
        bgView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if commentLabel.text == "" {
            commentLabel.text = memory.comment
            bgView.backgroundColor = .black.withAlphaComponent(0.7)
        } else {
            bgView.backgroundColor = .clear
            commentLabel.text = ""
        }
    }
}
