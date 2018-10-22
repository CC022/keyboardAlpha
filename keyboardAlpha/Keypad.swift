import Foundation
import UIKit

class keypad {
    private struct constants {
        //        static let farThreshold:CGFloat = 200
    }
    
    enum keys: String {
        case delete,space,capsLock,enter,q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m,Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M
    }
    
    enum keypadState {
        case selectKeypad
        case selectedQWE
        case selectedRTY
        case selectedUIO
        case selectedControlPad
    }
    
    var currentState = keypadState.selectKeypad
    var capLocked = false
    
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
    
    func direct(of displacement:CGPoint) -> sweepDirection {
        var direction: sweepDirection
        let angleOfTranslation = atan2f(Float(displacement.x), Float(displacement.y))
        let distOfTranslation = dist(from: displacement)
        
        //        Tap should pass in (0,0) as displacement
        if distOfTranslation == 0 {return .Middle}
        
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
    
    func getKey(with direction: sweepDirection) -> keys? {
        switch currentState {
        case .selectKeypad:
            switch direction {
            case .Middle:
                currentState = .selectedRTY
            case .UpperLeft:
                currentState = .selectedQWE
            case .Up:
                currentState = .selectedControlPad
            case .UpperRight:
                currentState = .selectedUIO
            case .Left:
                currentState = .selectedQWE
            case .Right:
                currentState = .selectedUIO
            case .LowerLeft:
                currentState = .selectedQWE
            case .Down:
                return .space
            case .LowerRight:
                currentState = .selectedUIO
            }
            return nil
            
        case .selectedQWE:
            currentState = .selectKeypad
            switch direction {
            case .UpperLeft:
                return capLocked ? .Q : .q
            case .Up:
                return capLocked ? .W : .w
            case .UpperRight:
                return capLocked ? .E : .e
            case .Left:
                return capLocked ? .A : .a
            case .Middle:
                return capLocked ? .S : .s
            case .Right:
                return capLocked ? .D : .d
            case .LowerLeft:
                return capLocked ? .Z : .z
            case .Down:
                return capLocked ? .X : .x
            case .LowerRight:
                return capLocked ? .C : .c
            }
        case .selectedRTY:
            currentState = .selectKeypad
            switch direction {
            case .UpperLeft:
                return capLocked ? .R : .r
            case .Up:
                return capLocked ? .T : .t
            case .UpperRight:
                return capLocked ? .Y : .y
            case .Left:
                return capLocked ? .F : .f
            case .Middle:
                return capLocked ? .G : .g
            case .Right:
                return capLocked ? .H : .h
            case .LowerLeft:
                return capLocked ? .V : .v
            case .Down:
                return capLocked ? .B : .b
            case .LowerRight:
                return capLocked ? .N : .n
            }
        case .selectedUIO:
            currentState = .selectKeypad
            switch direction {
            case .UpperLeft:
                return capLocked ? .U : .u
            case .Up:
                return capLocked ? .I : .i
            case .UpperRight:
                return capLocked ? .O : .o
            case .Left:
                return capLocked ? .J : .j
            case .Middle:
                return capLocked ? .K : .k
            case .Right:
                return capLocked ? .L : .l
            case .LowerLeft:
                return capLocked ? .M : .m
            case .Down:
                return nil
            case .LowerRight:
                return capLocked ? .P : .p
            }
        case .selectedControlPad:
            currentState = .selectKeypad
            switch direction {
            case .Up:
                return keys.capsLock
            case .Left:
                return keys.delete
            case .Right:
                return keys.enter
            default:
                return nil
            }
            
        }
    }
}
