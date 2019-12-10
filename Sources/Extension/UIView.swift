//
//  UIView+F.swift
//  
//
//  Created by Felix on 2018/5/23.
//

import UIKit

public extension UIView {
    
    func addConstraints(with visualFormat: String, views: [String: Any]) {
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormat, options: [], metrics: nil, views: views))
    }
    
    func addConstraints(with visualFormat: String, options: NSLayoutConstraint.FormatOptions, metrics: [String: Any]?, views: [String: Any]) {
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormat, options: options, metrics: metrics, views: views))
    }
    
    func addConstraintsToFill(theView: UIView) {
        theView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[theView]|", options: [], metrics: nil, views: ["theView": theView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[theView]|", options: [], metrics: nil, views: ["theView": theView]))
    }
    
    func snap() -> UIImage? {
        let layer = self.layer
        let rect = layer.frame
        UIGraphicsBeginImageContextWithOptions(rect.size, layer.isOpaque, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
