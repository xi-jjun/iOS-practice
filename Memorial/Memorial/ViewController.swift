//
//  ViewController.swift
//  Memorial
//
//  Created by 김재준 on 2022/09/17.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {
    @IBOutlet weak var memorialShowBtn: UIButton!

    @IBOutlet weak var ImageCollections: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController - viewDidLoad() called")
        
        memorialShowBtn.layer.cornerRadius = 10
    }

    @IBAction func memorialShowBtnPressed(_ sender: UIButton) {
        print("ViewController - memorialShowBtnPressed() called")
        let picker = YPImagePicker()
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
//                print(photo.fromCamera) // Image source (camera or library)
//                print(photo.image) // Final image selected by the user
//                print(photo.originalImage) // original image selected by the user, unfiltered
//                print(photo.modifiedImage) // Transformed image, can be nil
//                print(photo.exifMeta) // Print exif meta data of original image.
                ImageCollections.setI
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
}

