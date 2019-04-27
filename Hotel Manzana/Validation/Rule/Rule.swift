//
//  Rule.swift
//  Hotel Manzana
//
//  Created by Viktor on 27/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

protocol Rule {
    var regEx: String { get }
    var empty: String { get }
    var failure: String { get }
    var success: String { get }
}
