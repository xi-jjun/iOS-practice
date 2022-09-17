//
//  PicturePickUpController.swift
//  MyFirstApp
//
//  Created by 김재준 on 2022/09/17.
//

import Foundation
import UIKit
import YPImagePicker

class PicturePickUpController: UIViewController {
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var pictureChangeBtn: UIButton!
    
    let imgPickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PicturePickUpController - init")
        self.pictureImage.layer.cornerRadius = 5
        self.pictureChangeBtn.layer.cornerRadius = 10
        
        pictureChangeBtn.addTarget(self, action: #selector(onPictureChangeBtnClicked), for: .touchUpInside)
    }
    
    @objc fileprivate func onPictureChangeBtnClicked() {
        print("PicturePickUpController - onPictureChangeBtnClicked called()")
        
        // camera configuration
        var config = YPImagePickerConfiguration()
        config.screens = [.library]
        config.library.maxNumberOfItems = 3
        
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                self.pictureImage.image = photo.image
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
}
