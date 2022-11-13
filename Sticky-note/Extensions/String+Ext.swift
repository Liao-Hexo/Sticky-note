//
//  String+Ext.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import Foundation

extension String {
    
    func getUserInitials() -> String{
        let names = self.components(separatedBy: " ")

        let firstNameInitials = names[0].prefix(1)
        let lastNameInitials = names[1].prefix(1)
    
        return  "\(firstNameInitials)\(lastNameInitials)".uppercased()
    }
    
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
