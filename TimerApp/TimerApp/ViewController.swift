//
//  ViewController.swift
//  TimerApp
//
//  Created by 김재준 on 2022/09/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    weak var timer: Timer?
    weak var alarmTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "SELECT"
        mainLabel.textColor = #colorLiteral(red: 0.5078580976, green: 0.4616191387, blue: 1, alpha: 1)
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.9663531184, blue: 0.9881731868, alpha: 1)
        resetBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        startBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        slider.setValue(0.5, animated: true)
        slider.thumbTintColor = #colorLiteral(red: 0.8466643691, green: 0.7486293912, blue: 1, alpha: 0.85)
        slider.tintColor = #colorLiteral(red: 1, green: 0.6221433878, blue: 0.7607420087, alpha: 0.8470588235)
        resetBtn.layer.cornerRadius = 10
        startBtn.layer.cornerRadius = 10
    }
    
    @objc func doAlarm() {
        AudioServicesPlaySystemSound(SystemSoundID(1321))
    }
    
    @objc func countTime() {
        if Int(slider.value * 60) > 0 {
            slider.value = Float(Int(slider.value * 60) - 1) / 60
            mainLabel.text = String(round(slider.value * 60)) + " s"
        } else {
            timer?.invalidate()
            mainLabel.text = "END!"
            
            alarmTimer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(doAlarm), userInfo: nil, repeats: true)
        }
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        mainLabel.text = String(round(sender.value * 60)) + " s"
    }
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        timer?.invalidate()
        alarmTimer?.invalidate()
    }
    
    @IBAction func startBtnTapped(_ sender: UIButton) {
        timer?.invalidate()
        
        // #selector(메모리주소) : 메모리주소를 담아서 어떤 함수를 가리킬 것인지 연결하는 것.
        // => 이 기법은 Objective-C에서 사용하던 기법이기에 @objc를 붙여줘야 하는 것
        // userInfo : 어떤 정보를 전달할 것인지
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
    }
    
}

