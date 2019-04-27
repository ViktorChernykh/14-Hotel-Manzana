//
//  EmailRule.swift
//  Hotel Manzana
//
//  Created by Viktor on 27/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

public struct EmailRule: Rule {
    //MARK: - Stored Properties
    private (set) var regEx: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    private (set) var empty: String = "Empty email"
    private (set) var failure: String = "Invalid email"
    private (set) var success: String = ""
}
