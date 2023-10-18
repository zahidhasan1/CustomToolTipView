//
//  TooltipManager.swift
//  CustomToolTipView
//
//  Created by ZEUS on 18/10/23.
//

import UIKit

protocol Tooltip {
    var key: String {get}
    var view: UIView {get}
    var didShow: Bool {get}
    var title: String? {get}
    var message: String {get}
    var direction: TooltipDirection {get}
    
    func setShown()
}

extension Tooltip {
    func addSnapshot(to parentView: UIView?) {
        guard direction != .center else { return }
        parentView?.addSnapshot(of: view)
    }
}

protocol ToolTipDelegate: NSObject {
    func toolTipDidComplete()
}

class TooltipManager: NSObject {
    
    private var parentView: UIView?
    private var tooltipsToShow: [Tooltip] = []
    var didSetupTooltips: Bool = false
    
    weak var delegate: ToolTipDelegate?
    
    func setup(tooltips: [Tooltip], darkView: UIView) {
        didSetupTooltips = true
        
        tooltipsToShow = tooltips
        parentView = darkView
        
        guard !tooltipsToShow.allSatisfy({ $0.didShow }) else {
            delegate?.toolTipDidComplete()
            return
        }
        
        parentView?.addDarkView { [weak self] in
            self?.showNext()
        }
    }
    
    private func showNext() {
        parentView?.removeTooltipView()
        
        guard let tooltip = tooltipsToShow.first else {
            parentView?.removeDarkView()
            if tooltipsToShow.isEmpty {
                delegate?.toolTipDidComplete()
            }
            return
        }
        
        tooltipsToShow.removeFirst()
        
        guard !tooltip.didShow else {
            showNext()
            return
        }
        
        let isLast = tooltipsToShow.count == 0
        
        let action = isLast ? "Done" : "Next"
        
        tooltip.addSnapshot(to: parentView)
        tooltip.view.showTooltip(title: tooltip.title,
                                 message: tooltip.message,
                                 action: action,
                                 direction: tooltip.direction,
                                 inView: parentView,
                                 onHide: { [weak self] (dismissAll) in
            guard let self = self else {return}
            tooltip.setShown()
            self.parentView?.removeSnapshots()
            if !dismissAll{
                self.showNext()
            }else{
                self.parentView?.removeTooltipView()
                self.parentView?.removeDarkView()
                self.delegate?.toolTipDidComplete()
            }
        })
    }
    
}
