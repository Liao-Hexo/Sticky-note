//
//  PinImage.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import UIKit

class PinImage: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImage(named: "asterisk")?.withRenderingMode(.alwaysTemplate)
        tintColor = .systemGray4
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
