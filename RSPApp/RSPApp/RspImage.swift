//
//  RspImage.swift
//  RSPApp
//
//  Created by 김재준 on 2022/09/19.
//

import Foundation
import UIKit

enum RspImage: String {
    case ready, rock, scissor, paper
    
    static func getImage(imageType: Rsp) -> UIImage {
        switch imageType {
        case Rsp.ready:
            return #imageLiteral(resourceName: "ready")
        case Rsp.rock:
            return #imageLiteral(resourceName: "rock")
        case Rsp.scissor:
            return #imageLiteral(resourceName: "scissors")
        case Rsp.paper:
            return #imageLiteral(resourceName: "paper")
        default:
            return #imageLiteral(resourceName: "ready")
        }
    }
}
