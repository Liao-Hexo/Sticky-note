//
//  UIButton+Ext.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import Foundation
import UIKit

extension UIButton {
    func animatePulse(){
       UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
        self.transform = CGAffineTransform(scaleX: 0.93, y:0.93)
       } completion: { (_) in
           UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
           }, completion:nil)
       }
   }
}
