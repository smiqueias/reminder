//
//  UITextField+Ext.swift
//  Reminder
//
//  Created by Saulo Nascimento on 01/05/25.
//

import UIKit

// MARK: - Delegate
extension UIViewController: @retroactive UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
