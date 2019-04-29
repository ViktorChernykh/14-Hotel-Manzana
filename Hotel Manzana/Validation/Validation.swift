//
//  Validation.swift
//  Hotel Manzana
//
//  Created by Viktor on 27/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import UIKit

struct Validation {
    enum RuleType {
        case alphabeticStringWithSpace
        case email
        case password
        case phoneNo
        case stringWithFirstLetterCaps
    }
    
    func getRule(_ type: RuleType) -> Rule {
        switch type {
        case .alphabeticStringWithSpace:
            return AlphabeticStringWithSpaceRule()
        case .email:
            return EmailRule()
        case .password:
            return PasswordRule()
        case .phoneNo:
            return PhoneNoRule()
        case .stringWithFirstLetterCaps:
            return StringWithFirstLetterCapsRule()
        }
    }
    
    func validationText(_ text: String, type: RuleType) -> String {
        let typeRule = getRule(type)
        if text.isEmpty { return typeRule.empty }
        
        let stringTest = NSPredicate(format: "SELF MATCHES %@", typeRule.regEx)
        let result = stringTest.evaluate(with: text)
        if result {
            return typeRule.success
        } else {
            return typeRule.failure
        }
    }
    
    func validationNoNil<T>(_ object: T?, text: String) -> String {
        guard object != nil else { return "\(text)" }
        return ""
    }
    
    func validationNumber(_ number: Int, min: Int?, max: Int?, type: RangeNumber) -> String {
        if let min = min, number < min {
            return type.minFailure
        }
        if let max = max, number > max {
            return type.maxFaillure
        }
        return type.success
    }
    
    func giveTextFieldColor(_ textField: UITextField, with result: String) {
        let errorColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.2)
        if result.isEmpty {
            //textField.backgroundColor = .white
            textField.superview?.backgroundColor = .white
        } else {
            //textField.backgroundColor = errorColor
            textField.superview?.backgroundColor = errorColor
        }
    }
    
    func giveLabelColor(_ label: UILabel, with result: String) {
        let errorColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.2)
        if result.isEmpty {
            label.superview?.backgroundColor = .white
        } else {
            label.superview?.backgroundColor = errorColor
        }
    }
}
