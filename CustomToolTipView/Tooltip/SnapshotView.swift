//
//  UIView+Extension.swift
//  CustomToolTipView
//
//  Created by ZEUS on 18/10/23.
//

import UIKit

class SnapshotView: UIImageView {
    
}

extension UIView {
    var snapshot: UIImage?{
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        let image = renderer.image { ctx in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
        return image
    }
    
    func addSnapshot(of view: UIView){
        guard let snapshot = view.snapshot else {return}
        let imageView = SnapshotView(image: snapshot)
        let globalPoint = convert(view.frame.origin, from: view.superview)
        imageView.frame = CGRect(origin: globalPoint, size: view.frame.size)
        addSubview(imageView)
        imageView.fadeIn()
    }
    
    func removeSnapshots() {
        subviews.filter({ $0 is SnapshotView }).forEach { (view) in
            view.fadeOut {
                view.removeFromSuperview()
            }
        }
    }

}
