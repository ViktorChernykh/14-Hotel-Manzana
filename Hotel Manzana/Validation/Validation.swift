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
        case noNil
        case password
        case phoneNo
        case rangeNumber
        case stringWithFirstLetterCaps
    }
    
    func getRule(_ type: RuleType) -> Rule {
        switch type {
        case .alphabeticStringWithSpace:
            return AlphabeticStringWithSpaceRule()
        case .email:
            return EmailRule()
        case .noNil:
            return NoNilRule()
        case .password:
            return PasswordRule()
        case .phoneNo:
            return PhoneNoRule()
        case .rangeNumber:
            return RangeNumberRule()
        case .stringWithFirstLetterCaps:
            return StringWithFirstLetterCapsRule()
        }
    }
    
    func validationText(_ text: String, type: RuleType, massage: String? = nil) -> ResultValid {
        var result = ResultValid()
        let typeRule = getRule(type)
        if text.isEmpty {
            result.isValid = false
            result.message = massage ?? typeRule.empty
            return result
        }
        
        let stringTest = NSPredicate(format: "SELF MATCHES %@", typeRule.regEx)
        result.isValid = stringTest.evaluate(with: text)
        if !result.isValid {
            result.message = typeRule.failure
        }
        return result
    }
    
    func validationNoNil<T>(_ object: T?, type: RuleType, massage: String? = nil) -> ResultValid {
        var result = ResultValid()
        let typeRule = getRule(type)
        if object == nil {
            result.isValid = false
            result.message = massage ?? typeRule.failure
        }
        return result
    }
    
    func validationNumber(_ number: Int, type: RuleType, min: Int? = nil, max: Int? = nil, massage: String? = nil) -> ResultValid {
        var result = ResultValid()
        
        guard let typeRule = getRule(type) as? RangeNumberRule else {
            result.isValid = false
            result.message = "The type \(RuleType.self) is not found"
            return result
        }
        
        if let min = min, number < min {
            result.isValid = false
            result.message = massage ?? typeRule.minFailure
        }
        if let max = max, number > max {
            result.isValid = false
            result.message = massage ?? typeRule.maxFailure
        }
        return result
    }
    
    func cangeTextFieldColor(_ textField: UITextField, with result: ResultValid) {
        let errorColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.2)
        if result.isValid {
            //textField.backgroundColor = .white
            textField.superview?.backgroundColor = .white
        } else {
            //textField.backgroundColor = errorColor
            textField.superview?.backgroundColor = errorColor
        }
    }
    
    func changeLabelColor(_ label: UILabel, with result: ResultValid) {
        let errorColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.2)
        if result.isValid {
            label.superview?.backgroundColor = .white
        } else {
            label.superview?.backgroundColor = errorColor
        }
    }
}
