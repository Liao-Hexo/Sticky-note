//
//  UserDefaultsManager.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import UIKit

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    let userDefaults = UserDefaults.standard
    
    private init() {}
    
    func setUserLogIn(){
        userDefaults.setValue(true, forKey: "isLoggedIn")
    }
    
    func setUserFullName(fullName: String){
        userDefaults.setValue(fullName, forKey: "userFullName")
    }
    
    func getUserFullName() -> String{
        let name = userDefaults.string(forKey: "userFullName")
        return name ?? "No Name"
    }
    
}
