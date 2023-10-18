//
//  TooltipDirection.swift
//  CustomToolTipView
//
//  Created by ZEUS on 18/10/23.
//

import Foundation

enum TooltipDirection {
    case up
    case down
    case right
    case left
    case center
    
    var isVertical: Bool {
        switch self {
        case .up, .down:
            return true
        default:
            return false
        }
    }
    
    var isHorizontal: Bool {
        switch self {
        case .right, .left:
            return true
        default:
            return false
        }
    }
}
