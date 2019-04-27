//
//  PhoneNoRule.swift
//  Hotel Manzana
//
//  Created by Viktor on 27/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

public struct PhoneNoRule: Rule {
    // MARK: - Stored Properties
    private (set) var regEx: String = "[0-9]{10,14}"
    private (set) var empty: String = "Empty phone"
    private (set) var failure: String = "Invalid phone"
    private (set) var success: String = ""
}
