//
//  NoNilRule.swift
//  Hotel Manzana
//
//  Created by Viktor on 01/05/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

public struct NoNilRule: Rule {
    // MARK: - Stored Properties
    private (set) var regEx: String = ""
    private (set) var empty: String = "The object is nil"
    private (set) var failure: String = "The object is nil"
    private (set) var success: String = "The object is not nil"
}
