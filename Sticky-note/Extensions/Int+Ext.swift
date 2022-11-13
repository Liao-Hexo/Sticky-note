//
//  Int+Ext.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import Foundation

extension Int{
    func checkValidCellNumber() -> Int{
        let list = [2,8,14,20,26,32]
        if list.contains(self){
            return self
        }
        return 0
    }
}
