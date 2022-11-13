//
//  NButton.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import UIKit

class NButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Color.dark
        layer.cornerRadius = self.frame.height/2
        layer.masksToBounds = false
        setTitleColor(.white, for: .normal)
        adjustsImageWhenHighlighted = false
        titleLabel?.font = UIFont(name: Font.semi_bold.rawValue, size: 16)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
