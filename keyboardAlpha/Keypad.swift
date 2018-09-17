//
//  Keypad.swift
//  keyboardAlpha
//
//  Created by zzc on 9/16/18.
//  Copyright © 2018 zzc. All rights reserved.
//

import Foundation
import UIKit

class keypad {
    var keys = [String]()
    
    enum sweepDirection {
        case UpperLeft
        case Up
        case UpperRight
        case Left
        case Middle
        case Right
        case LowerLeft
        case Down
        case LowerRight
    }
    
    
    func direct(of point:CGPoint) -> sweepDirection {
        var direction: sweepDirection
        let angleOfTranslation = atan2f(Float(point.x), Float(point.y))
        switch angleOfTranslation {
        case -7/8 * Float.pi ..< -5/8 * Float.pi:
            direction = .UpperLeft
        case -5/8 * Float.pi ..< -3/8 * Float.pi:
            direction = .Left
        case -3/8 * Float.pi ..< -1/8 * Float.pi:
            direction = .LowerLeft
        case -1/8 * Float.pi ..< 1/8 * Float.pi:
            direction = .Down
        case 1/8 * Float.pi ..< 3/8 * Float.pi:
            direction = .LowerRight
        case 3/8 * Float.pi ..< 5/8 * Float.pi:
            direction = .Right
        case 5/8 * Float.pi ..< 7/8 * Float.pi:
            direction = .UpperRight
        default:
            direction = .Up
        }
        return direction
    }
    
    func dist(from point:CGPoint) -> CGFloat {
        return (point.x * point.x + point.y * point.y).squareRoot()
    }
    
    
}
