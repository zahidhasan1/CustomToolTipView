//
//  UIView+Extension.swift
//  CustomToolTipView
//
//  Created by ZEUS on 18/10/23.
//

import UIKit
extension UIView{
    func fadeIn(completion: (() -> Void)? = nil){
        alpha = 0
        isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
        } completion: { _ in
            completion?()
        }
    }
    
    func fadeOut(completion: (()-> Void)? = nil){
        UIView.animate(withDuration: 0.3) {
            self.alpha = 0
        } completion: { _ in
            completion?()
        }

    }
}
