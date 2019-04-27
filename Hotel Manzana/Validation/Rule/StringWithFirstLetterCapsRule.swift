//
//  StringWithFirstLetterCapsRule.swift
//  Hotel Manzana
//
//  Created by Viktor on 27/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

public struct StringWithFirstLetterCapsRule: Rule {
    //MARK: - Stored Properties
    private (set) var regEx: String = "[A-ZА-Я]+[a-zA-Z а-яА-Я]*$"
    private (set) var empty: String = "Empty String"
    private (set) var failure: String = "The first letter must be uppercase"
    private (set) var success: String = ""
}
