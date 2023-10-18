//
//  DarkView.swift
//  CustomToolTipView
//
//  Created by ZEUS on 18/10/23.
//

import UIKit

class DarkView: UIView{
    
}

extension UIView{
    func addDarkView(completion: (() -> Void)? = nil){
        removeDarkView()
        
        DispatchQueue.main.async {
            let darkView = DarkView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
            darkView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            self.addSubview(darkView)
            
            NSLayoutConstraint.activate([
                darkView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                darkView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                darkView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                darkView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
            ])
            
            darkView.fadeIn(){
                completion?()
            }
            
        }
    }
    
    func removeDarkView(){
        DispatchQueue.main.async {
            for subview in self.subviews{
                if let subview = subview as? DarkView{
                    subview.fadeOut(){
                        subview.removeFromSuperview()
                    }
                }
            }
        }
    }
    
    var showingDarkView: Bool{
        return subviews.first(where: {$0 is DarkView}) != nil
    }
}
