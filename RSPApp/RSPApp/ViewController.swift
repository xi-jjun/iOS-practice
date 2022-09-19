//
//  ViewController.swift
//  RSPApp
//
//  Created by 김재준 on 2022/09/18.
//

import UIKit

class ViewController: UIViewController {
    let SELECT_TEXT = "선택하세요"
    let READY_TEXT = "Ready?"
    let WIN_TEXT = "WIN!! :>"
    let LOSE_TEXT = "LOSE :<"
    let DRAW_TEXT = "DRAW~ :I"
    
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
    }
    
    private func resetText() {
        selectTitle.text = SELECT_TEXT
        comStatusLabel.text = READY_TEXT
        userStatusLabel.text = READY_TEXT
    }
    
    private func resetImage() {
        userImage.image = RspImage.getImage(imageType: Rsp.ready)
        comImage.image = RspImage.getImage(imageType: Rsp.ready)
    }
    
    private func showResult(computerResult: String, userResult: String) {
        comStatusLabel.text = computerResult
        userStatusLabel.text = userResult
    }
    
    private func isDraw(comChoice: Rsp, userChoice: Rsp) -> Bool {
        return comChoice == userChoice
    }
    
    private func comWin(comChoice: Rsp, userChoice: Rsp) -> Bool {
        return (comChoice == Rsp.scissor && userChoice == Rsp.paper) ||
        (comChoice == Rsp.paper && userChoice == Rsp.rock) ||
        (comChoice == Rsp.rock && userChoice == Rsp.scissor)
    }
    
    private func process(userChoice: Rsp) {
        let comChoice = Rsp(rawValue: Int.random(in: 0...2))
        comImage.image = RspImage.getImage(imageType: comChoice!)
        userImage.image = RspImage.getImage(imageType: userChoice)
        print("user : ", userChoice, ", computer : ", comChoice!)
        
        if comChoice == userChoice {
            showResult(computerResult: DRAW_TEXT, userResult: DRAW_TEXT)
        } else if comWin(comChoice: comChoice!, userChoice: userChoice) {
            showResult(computerResult: WIN_TEXT, userResult: LOSE_TEXT)
        } else {
            showResult(computerResult: LOSE_TEXT, userResult: WIN_TEXT)
        }
    }
    
    @IBAction func resetBtnPressed(_ sender: UIButton) {
        print("ViewController - resetBtnPressed() called")
        resetText()
        resetImage()
    }
    
    @IBAction func rspBtnTapped(_ sender: UIButton) {
        print("ViewController - rspBtnTapped() called")
        
        let title = sender.currentTitle!
        switch title {
        case "가위":
            process(userChoice: Rsp.scissor)
        case "바위":
            process(userChoice: Rsp.rock)
        case "보":
            process(userChoice: Rsp.paper)
        default:
            break
        }
    }
    
}

