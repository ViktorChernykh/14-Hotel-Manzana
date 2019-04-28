//
//  RangeNumberRule.swift
//  Hotel Manzana
//
//  Created by Viktor on 28/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

public struct RangeNumberRule: Rule {
    // MARK: - Stored Properties
    private (set) var regEx: String = ""
    private (set) var empty: String = "Less than acceptable"
    private (set) var failure: String = "More than acceptable"
    private (set) var success: String = ""
}
