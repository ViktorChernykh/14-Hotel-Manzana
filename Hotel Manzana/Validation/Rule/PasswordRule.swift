//
//  PasswordRule.swift
//  Hotel Manzana
//
//  Created by Viktor on 27/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

public struct PasswordRule: Rule {
    // MARK: - Stored Properties
    private (set) var regEx: String = "^.{6,15}$"
    private (set) var empty: String = "Empty password"
    private (set) var failure: String = "Invalid password"
    private (set) var success: String = ""
}
