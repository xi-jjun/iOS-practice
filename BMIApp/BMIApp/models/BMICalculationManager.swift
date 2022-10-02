//
//  BMICalculationManager.swift
//  BMIApp
//
//  Created by 김재준 on 2022/10/01.
//

import Foundation

/**
 BMI를 계산하는 객체의 역할을 하는 것.
 BMI를 계산하는 모든 로직을 여기에 둘 것이다.
 
 하나의 view controller에서만 접근하기에 struct로 만들었다. 아마 여러개의 view controller에서 동시에 접근할 수 있게 하려면
 heap 영역에 두는게 좋고, 따라서 class로 선언해야할 수도 있다.
 */
struct BMICalculationManager {
    private let showLevel: Double = 100.0
    
    func calculateBMI(weight: Double, height: Double) -> Double {
        let meterHeight: Double = height / 100
        let squareHeight: Double = pow(meterHeight, 2)
        
        return weight / squareHeight
    }
    
    func getBMIStringResult(weightData: Double?, heightData: Double?) -> String {
        guard let weight: Double = weightData else { return "" }
        guard let height: Double = heightData else { return "" }
        
        var result = calculateBMI(weight: weight, height: height)
        result = Double(round(result * showLevel) / showLevel)
        
        return "\(result)"
    }
}
