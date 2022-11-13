//
//  UIViewController+Ext.swift
//  Sticky-note
//
//  Created by 廖家龙 on 2022/11/13.
//

import Foundation
import UIKit

enum AlertAction{
    case no
    case yes
}
extension UIViewController{
    
    func presentAlertError(title: String, message: String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentAlertWarning(title: String, message: String, completion: @escaping ( (Result<AlertAction, Error>)-> Void? )){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
            completion(.success(.no))
        }))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
            completion(.success(.yes))
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
