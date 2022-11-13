//
//  AddFloatingButton.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import UIKit

class AddFloatingButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let image = UIImage(systemName: "plus",withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold))
        setImage(image, for: .normal)
        tintColor = .white
        backgroundColor = Color.red
        layer.cornerRadius = 20
        animatePulse()
        adjustsImageWhenHighlighted = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
