//
//  ViewController.swift
//  RSPApp
//
//  Created by 김재준 on 2022/09/18.
//

import UIKit

struct Actions {
    var image: UIImage
    var definition: String
}

class ViewController: UIViewController {
    let ROCK: String = "rock"
    let SISSOR: String = "sissors"
    let PAPER: String = "paper"
    let SELECT_TEXT = "선택하세요"
    let READY_TEXT = "Ready?"
    
    let readyImage: UIImage = #imageLiteral(resourceName: "ready")
    var rspComponentList = [Actions]()

    @IBOutlet weak var selectTitle: UILabel!
    @IBOutlet weak var comStatusLabel: UILabel!
    @IBOutlet weak var userStatusLabel: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var comImage: UIImageView!
    
    @IBOutlet weak var paperBtn: UIButton!
    @IBOutlet weak var rockBtn: UIButton!
    @IBOutlet weak var sisorBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetImage()
        rspComponentList.append(Actions(image: #imageLiteral(resourceName: "rock"), definition: ROCK))
        rspComponentList.append(Actions(image: #imageLiteral(resourceName: "scissors"), definition: SISSOR))
        rspComponentList.append(Actions(image: #imageLiteral(resourceName: "paper"), definition: PAPER))
    }
    
    private func resetText() {
        selectTitle.text = SELECT_TEXT
        comStatusLabel.text = READY_TEXT
        userStatusLabel.text = READY_TEXT
    }
    
    private func resetImage() {
        userImage.image = readyImage
        comImage.image = readyImage
    }
    
    private func showResult(computerResult: String, userResult: String) {
        comStatusLabel.text = computerResult
        userStatusLabel.text = userResult
    }

    @IBAction func resetBtnPressed(_ sender: UIButton) {
        print("ViewController - resetBtnPressed() called")
        resetText()
        resetImage()
    }
    
    @IBAction func sisorBtnTapped(_ sender: UIButton) {
        print("ViewController - sisorBtnTapped() called")
        let computerResult = rspComponentList.randomElement()
        comImage.image = computerResult?.image
        userImage.image = rspComponentList[1].image

        if (computerResult?.definition == SISSOR) {
            showResult(computerResult: "무승부!", userResult: "무승부!")
        } else if (computerResult?.definition == ROCK) {
            showResult(computerResult: "Win!", userResult: "Lose :(")
        } else {
            showResult(computerResult: "Lose:)", userResult: "Win!!!")
        }
    }
    
    @IBAction func rockBtnTapped(_ sender: UIButton) {
        print("ViewController - rockBtnTapped() called")
        
        let computerResult = rspComponentList.randomElement()
        comImage.image = computerResult?.image
        userImage.image = rspComponentList[0].image

        if (computerResult?.definition == ROCK) {
            showResult(computerResult: "무승부!", userResult: "무승부!")
        } else if (computerResult?.definition == PAPER) {
            showResult(computerResult: "Win!", userResult: "Lose :(")
        } else {
            showResult(computerResult: "Lose:)", userResult: "Win!!!")
        }
    }
    
    @IBAction func paperBtnTapped(_ sender: UIButton) {
        print("ViewController - paperBtnTapped() called")
        
        let computerResult = rspComponentList.randomElement()
        comImage.image = computerResult?.image
        userImage.image = rspComponentList[2].image

        if (computerResult?.definition == PAPER) {
            showResult(computerResult: "무승부!", userResult: "무승부!")
        } else if (computerResult?.definition == SISSOR) {
            showResult(computerResult: "Win!", userResult: "Lose :(")
        } else {
            showResult(computerResult: "Lose:)", userResult: "Win!!!")
        }
    }
}

