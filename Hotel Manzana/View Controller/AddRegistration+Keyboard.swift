//
//  AddRegistration+Keyboard.swift
//  Hotel Manzana
//
//  Created by Viktor on 26/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import  UIKit

// MARK: - Text Field Delegate
extension AddRegistrationTableViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        isCheckInDatePickerShown = false
        isCheckOutDatePickerShown = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        switch textField {
        case firstNameField:
            lastNameField.becomeFirstResponder()
        case lastNameField:
            emailField.becomeFirstResponder()
        default:
            break
        }
        
        activeField = nil
        return true
    }
}

extension AddRegistrationTableViewController {
    @IBAction func onTapGestureRecognized(_ sender: AnyObject) {
        activeField?.resignFirstResponder()
    }
}