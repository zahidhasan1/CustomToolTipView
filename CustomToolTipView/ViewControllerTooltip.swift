//
//  ViewControllerTooltip.swift
//  CustomToolTipView
//
//  Created by ZEUS on 18/10/23.
//


import UIKit

enum ViewControllerTooltip: Tooltip {
    case title(in: UIView)
    case image(in: UIView)
    case button(in: UIView)
    
    var key: String {
        let prefix: String = "tooltip_didshow_"
        switch self {
        case .title: return "\(prefix)title"
        case .image: return "\(prefix)image"
        case .button: return "\(prefix)button"
        }
    }
    
    var didShow: Bool {
        return false
        //return UserDefaults.standard.bool(forKey: key)
    }
    
    func setShown() {
        UserDefaults.standard.set(true, forKey: key)
    }
    
    var direction: TooltipDirection {
        switch self {
        case .title: return .up
        case .image: return .up
        case .button: return .up
        }
    }
    
    var title: String? {
        return nil
    }
    
    var message: String {
        switch self {
        case .title: return "This is the title"
        case .image: return "This is the image"
        case .button: return "In this article, we will talk about a few possible solutions and also one that we came up within my team, that ended up solving the problem to any view structure or size of screen"
        }
    }
    
    var view: UIView {
        switch self {
        case let .title(view):
            return view
        case let .image(view):
            return view
        case let .button(view):
            return view
        }
    }
}
