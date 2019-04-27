//
//  AlphabeticStringWithSpaceRule.swift
//  Hotel Manzana
//
//  Created by Viktor on 27/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

public struct AlphabeticStringWithSpaceRule: Rule {
    //MARK: - Stored Properties
    private (set) var regEx: String = "^[a-zA-Z а-яА-Я]*$"
    private (set) var empty: String = "Empty String"
    private (set) var failure: String = "The string contains invalid characters"
    private (set) var success: String = ""

}
