//
//  BMICalculationManager.swift
//  BMIApp
//
//  Created by 김재준 on 2022/10/01.
//

import Foundation
import UIKit

/**
 BMI를 계산하는 객체의 역할을 하는 것.
 BMI를 계산하는 모든 로직을 여기에 둘 것이다.
 
 하나의 view controller에서만 접근하기에 struct로 만들었다. 아마 여러개의 view controller에서 동시에 접근할 수 있게 하려면
 heap 영역에 두는게 좋고, 따라서 class로 선언해야할 수도 있다.
 */
struct BMICalculationManager {
    private let showLevel: Double = 100.0
    private let LOW_BMI = "저체중"
    private let NORMAL_BMI = "정상체중"
    private let OVER_BMI = "과체중"
    private let SEVERE_BMI = "비만"
    private let ERROR_MESSAGE = "BMI Status error"
    
    var bmiValue: Double?
    var bmi: BMI?
    
    mutating func calculateBMI(weightData: Double?, heightData: Double?) {
        guard let weight: Double = weightData else {
            bmiValue = 0.0
            return
        }
        guard let height: Double = heightData else {
            bmiValue = 0.0
            return
        }
        
        let meterHeight: Double = height / 100
        let squareHeight: Double = pow(meterHeight, 2)
        
        bmiValue = weight / squareHeight
    }
    
    func getBMIColorAndStatus() -> (UIColor, String) {
        guard let bmiResult = bmiValue else { return (UIColor.black, ERROR_MESSAGE) }
        switch bmiResult {
        case ..<18.6:
            return (.lightGray, LOW_BMI)
        case ..<23.0:
            return (.green, NORMAL_BMI)
        case ..<25.0:
            return (.orange, OVER_BMI)
        case 25.0...:
            return (.red, SEVERE_BMI)
        default:
            return (.black, ERROR_MESSAGE)
        }
    }
    
    mutating func getBMI(weight: Double?, height: Double?) -> BMI? {
        calculateBMI(weightData: weight, heightData: height)
        let bmiInfo = getBMIColorAndStatus()
        bmi = BMI(color: bmiInfo.0, value: bmiValue, status: bmiInfo.1)
        
        return bmi
    }
}
